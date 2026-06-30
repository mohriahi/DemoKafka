type Equipment record {|
    string equipmentName;
    string equipmentId;
    string? manufacturer;
    string? model;
    string? serialNumber;
|};

type EquipmentList record {|
    Equipment[] equipment;
|};
