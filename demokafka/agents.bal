// Equipment Integration - XML to PostgreSQL and Kafka with XSLT-style Transformation
//
// WORKFLOW:
// 1. Receive XML equipment data via HTTP POST
// 2. Parse XML and extract equipment data
// 3. Insert original data into PostgreSQL
// 4. Apply XSLT-style transformation to enrich data
// 5. Publish enriched data to Kafka topic
//
// XSLT TRANSFORMATION (for Kafka):
// Adds metadata including:
// - processedAt: ISO 8601 timestamp
// - priority: HIGH, MEDIUM, or NORMAL based on equipment type
// - category: MACHINING, FORMING, CUTTING, ASSEMBLY, ADDITIVE_MANUFACTURING, or GENERAL
// - source: EquipmentIntegrationService
//
// SETUP:
//
// 1. Start all services (PostgreSQL + Kafka + Kafka UI):
//
//    docker compose up -d
//
//    Services disponibles :
//    - PostgreSQL  : localhost:5432
//    - Kafka       : localhost:29092
//    - Kafka UI    : http://localhost:8090
//
// 2. Run the service:
//
//    bal run
//
// 3. Test with curl (see automation.bal for sample payloads):
//
//    curl -X POST http://localhost:8080/api/equipment \
//      -H "Content-Type: application/xml" \
//      -d '<equipmentList><equipment><equipmentName>CNC Machine</equipmentName><equipmentId>EQ001</equipmentId><manufacturer>ACME Corp</manufacturer><model>CNC-2000</model><serialNumber>SN123456</serialNumber></equipment></equipmentList>'
//
// 4. Verify:
//    - PostgreSQL : SELECT * FROM equipment;
//    - Kafka UI   : http://localhost:8090 → Topics → equipment.topic → Messages
