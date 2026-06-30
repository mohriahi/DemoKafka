// Sample XML Payload with 5 Equipment Records
//
// FORMATTED XML (for readability):
//
// <equipmentList>
//     <equipment>
//         <equipmentName>CNC Milling Machine</equipmentName>
//         <equipmentId>EQ001</equipmentId>
//         <manufacturer>ACME Manufacturing</manufacturer>
//         <model>CNC-2000X</model>
//         <serialNumber>SN-2024-001</serialNumber>
//     </equipment>
//     <equipment>
//         <equipmentName>Hydraulic Press</equipmentName>
//         <equipmentId>EQ002</equipmentId>
//         <manufacturer>TechPress Industries</manufacturer>
//         <model>HP-5000</model>
//         <serialNumber>SN-2024-002</serialNumber>
//     </equipment>
//     <equipment>
//         <equipmentName>Laser Cutting System</equipmentName>
//         <equipmentId>EQ003</equipmentId>
//         <manufacturer>LaserTech Solutions</manufacturer>
//         <model>LCS-3000</model>
//         <serialNumber>SN-2024-003</serialNumber>
//     </equipment>
//     <equipment>
//         <equipmentName>Robotic Welding Arm</equipmentName>
//         <equipmentId>EQ004</equipmentId>
//         <manufacturer>RoboWeld Corp</manufacturer>
//         <model>RWA-7500</model>
//         <serialNumber>SN-2024-004</serialNumber>
//     </equipment>
//     <equipment>
//         <equipmentName>Industrial 3D Printer</equipmentName>
//         <equipmentId>EQ005</equipmentId>
//         <manufacturer>PrintPro Systems</manufacturer>
//         <model>IP3D-9000</model>
//         <serialNumber>SN-2024-005</serialNumber>
//     </equipment>
// </equipmentList>
//
// ============================================================
// MINIFIED XML (for curl command):
// ============================================================
//
// <equipmentList><equipment><equipmentName>CNC Milling Machine</equipmentName><equipmentId>EQ001</equipmentId><manufacturer>ACME Manufacturing</manufacturer><model>CNC-2000X</model><serialNumber>SN-2024-001</serialNumber></equipment><equipment><equipmentName>Hydraulic Press</equipmentName><equipmentId>EQ002</equipmentId><manufacturer>TechPress Industries</manufacturer><model>HP-5000</model><serialNumber>SN-2024-002</serialNumber></equipment><equipment><equipmentName>Laser Cutting System</equipmentName><equipmentId>EQ003</equipmentId><manufacturer>LaserTech Solutions</manufacturer><model>LCS-3000</model><serialNumber>SN-2024-003</serialNumber></equipment><equipment><equipmentName>Robotic Welding Arm</equipmentName><equipmentId>EQ004</equipmentId><manufacturer>RoboWeld Corp</manufacturer><model>RWA-7500</model><serialNumber>SN-2024-004</serialNumber></equipment><equipment><equipmentName>Industrial 3D Printer</equipmentName><equipmentId>EQ005</equipmentId><manufacturer>PrintPro Systems</manufacturer><model>IP3D-9000</model><serialNumber>SN-2024-005</serialNumber></equipment></equipmentList>
//
// ============================================================
// CURL COMMAND:
// ============================================================
//
// curl -X POST http://localhost:8080/api/equipment \
//   -H "Content-Type: application/xml" \
//   -d '<equipmentList><equipment><equipmentName>CNC Milling Machine</equipmentName><equipmentId>EQ001</equipmentId><manufacturer>ACME Manufacturing</manufacturer><model>CNC-2000X</model><serialNumber>SN-2024-001</serialNumber></equipment><equipment><equipmentName>Hydraulic Press</equipmentName><equipmentId>EQ002</equipmentId><manufacturer>TechPress Industries</manufacturer><model>HP-5000</model><serialNumber>SN-2024-002</serialNumber></equipment><equipment><equipmentName>Laser Cutting System</equipmentName><equipmentId>EQ003</equipmentId><manufacturer>LaserTech Solutions</manufacturer><model>LCS-3000</model><serialNumber>SN-2024-003</serialNumber></equipment><equipment><equipmentName>Robotic Welding Arm</equipmentName><equipmentId>EQ004</equipmentId><manufacturer>RoboWeld Corp</manufacturer><model>RWA-7500</model><serialNumber>SN-2024-004</serialNumber></equipment><equipment><equipmentName>Industrial 3D Printer</equipmentName><equipmentId>EQ005</equipmentId><manufacturer>PrintPro Systems</manufacturer><model>IP3D-9000</model><serialNumber>SN-2024-005</serialNumber></equipment></equipmentList>'
//
// ============================================================
// EQUIPMENT DETAILS:
// ============================================================
//
// 1. CNC Milling Machine (EQ001)
//    - Manufacturer: ACME Manufacturing
//    - Model: CNC-2000X
//    - Serial: SN-2024-001
//
// 2. Hydraulic Press (EQ002)
//    - Manufacturer: TechPress Industries
//    - Model: HP-5000
//    - Serial: SN-2024-002
//
// 3. Laser Cutting System (EQ003)
//    - Manufacturer: LaserTech Solutions
//    - Model: LCS-3000
//    - Serial: SN-2024-003
//
// 4. Robotic Welding Arm (EQ004)
//    - Manufacturer: RoboWeld Corp
//    - Model: RWA-7500
//    - Serial: SN-2024-004
//
// 5. Industrial 3D Printer (EQ005)
//    - Manufacturer: PrintPro Systems
//    - Model: IP3D-9000
//    - Serial: SN-2024-005
