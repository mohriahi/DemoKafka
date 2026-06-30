import ballerina/http;
import ballerina/io;
import ballerinax/metrics.logs as _;
import ballerinax/wso2.controlplane as _;

import wso2/icp.runtime.bridge as _;

listener http:Listener httpListener = check new (8080);

service /api on httpListener {

    resource function post equipment(@http:Payload xml equipmentXml) returns http:Created|http:InternalServerError {

        io:println("Received XML:");
        io:println(equipmentXml.toString());
        io:println("---");

        // Extract equipment elements from input XML
        xml equipmentElements = equipmentXml/<equipment>;

        int successCount = 0;

        foreach xml equipmentElement in equipmentElements {
            xml equipmentNameElement = equipmentElement/<equipmentName>;
            xml equipmentIdElement = equipmentElement/<equipmentId>;
            xml manufacturerElement = equipmentElement/<manufacturer>;
            xml modelElement = equipmentElement/<model>;
            xml serialNumberElement = equipmentElement/<serialNumber>;

            string equipmentName = equipmentNameElement.data();
            string equipmentId = equipmentIdElement.data();
            string manufacturerData = manufacturerElement.data();
            string modelData = modelElement.data();
            string serialNumberData = serialNumberElement.data();

            Equipment equipment = {
                equipmentName: equipmentName,
                equipmentId: equipmentId,
                manufacturer: manufacturerData == "" ? () : manufacturerData,
                model: modelData == "" ? () : modelData,
                serialNumber: serialNumberData == "" ? () : serialNumberData
            };

            // Insert into database
            error? dbResult = insertEquipment(equipment);

            if dbResult is error {
                return <http:InternalServerError>{
                    body: {
                        message: "Failed to insert equipment into database",
                        equipmentId: equipmentId,
                        detail: dbResult.message()
                    }
                };
            }

            // Publish to Kafka with XSLT-style transformation
            io:println("--- XSLT Transformation for Kafka ---");
            error? mqResult = publishToKafka(equipment);
            io:println("-------------------------------------");

            if mqResult is error {
                io:println(string `Warning: Failed to publish ${equipmentId} to Kafka: ${mqResult.message()}`);
                // Continue processing even if ActiveMQ fails
            }

            successCount += 1;
        }

        io:println(string `Successfully inserted ${successCount} equipment records`);

        return <http:Created>{
            body: {
                message: "Equipment added successfully",
                inserted: successCount
            }
        };
    }
}
