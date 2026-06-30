import ballerina/io;
import ballerina/sql;
import ballerinax/postgresql.driver as _;
import ballerinax/kafka;

function insertEquipment(Equipment equipment) returns error? {
    sql:ParameterizedQuery insertQuery = `
        INSERT INTO equipment (equipment_id, equipment_name, manufacturer, model, serial_number)
        VALUES (${equipment.equipmentId}, ${equipment.equipmentName}, ${equipment.manufacturer}, 
                ${equipment.model}, ${equipment.serialNumber})
    `;
    
    sql:ExecutionResult result = check dbClient->execute(insertQuery);
    
    io:println(string `Inserted equipment: ${equipment.equipmentId} - ${equipment.equipmentName}`);
    io:println(string `  Affected rows: ${result.affectedRowCount ?: 0}`);
}

function publishToKafka(Equipment equipment) returns error? {
    // Apply XSLT-style transformation to enrich the data
    xml enrichedMessage = enrichEquipmentForActiveMq(equipment);
    string messageBody = enrichedMessage.toString();

    kafka:AnydataProducerRecord producerRecord = {
        topic: kafkaTopic,
        key: equipment.equipmentId.toBytes(),
        value: messageBody.toBytes()
    };

    check kafkaProducer->send(producerRecord);

    io:println(string `✓ Published enriched data to Kafka topic '${kafkaTopic}': ${equipment.equipmentId}`);
}