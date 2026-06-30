import ballerina/io;
import ballerina/time;

// XSLT-style transformation to enrich equipment data
function enrichEquipmentForActiveMq(Equipment equipment) returns xml {
    io:println(string `Applying XSLT-style transformation for Kafka: ${equipment.equipmentId}`);
    
    // Get current timestamp
    time:Utc currentTime = time:utcNow();
    string timestamp = time:utcToString(currentTime);
    
    // Determine priority based on equipment type
    string priority = determinePriority(equipment.equipmentName);
    
    // Categorize equipment
    string category = categorizeEquipment(equipment.equipmentName);
    
    string manufacturerVal = equipment.manufacturer ?: "";
    string modelVal = equipment.model ?: "";
    string serialNumberVal = equipment.serialNumber ?: "";

    // Create enriched XML with additional metadata
    xml enrichedXml = xml `<enrichedEquipment>
        <metadata>
            <processedAt>${timestamp}</processedAt>
            <priority>${priority}</priority>
            <category>${category}</category>
            <source>EquipmentIntegrationService</source>
        </metadata>
        <equipmentData>
            <equipmentId>${equipment.equipmentId}</equipmentId>
            <equipmentName>${equipment.equipmentName}</equipmentName>
            <manufacturer>${manufacturerVal}</manufacturer>
            <model>${modelVal}</model>
            <serialNumber>${serialNumberVal}</serialNumber>
        </equipmentData>
    </enrichedEquipment>`;
    
    io:println(string `  Priority: ${priority}, Category: ${category}`);
    
    return enrichedXml;
}

// Determine priority based on equipment name
function determinePriority(string equipmentName) returns string {
    string lowerName = equipmentName.toLowerAscii();
    
    if lowerName.includes("cnc") || lowerName.includes("laser") {
        return "HIGH";
    } else if lowerName.includes("robot") || lowerName.includes("3d") {
        return "MEDIUM";
    } else {
        return "NORMAL";
    }
}

// Categorize equipment
function categorizeEquipment(string equipmentName) returns string {
    string lowerName = equipmentName.toLowerAscii();
    
    if lowerName.includes("cnc") || lowerName.includes("milling") {
        return "MACHINING";
    } else if lowerName.includes("press") || lowerName.includes("hydraulic") {
        return "FORMING";
    } else if lowerName.includes("laser") || lowerName.includes("cutting") {
        return "CUTTING";
    } else if lowerName.includes("robot") || lowerName.includes("welding") {
        return "ASSEMBLY";
    } else if lowerName.includes("printer") || lowerName.includes("3d") {
        return "ADDITIVE_MANUFACTURING";
    } else {
        return "GENERAL";
    }
}
