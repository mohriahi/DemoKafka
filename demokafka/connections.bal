import ballerinax/postgresql;
import ballerinax/kafka;

final postgresql:Client dbClient = check new (
    host = dbHost,
    port = dbPort,
    database = dbName,
    username = dbUser,
    password = dbPassword
);

final kafka:Producer kafkaProducer = check new (kafkaBootstrapServers,
    config = {
        clientId: "equipment-producer",
        acks: "1",
        retryCount: 3
    }
);
