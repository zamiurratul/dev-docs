### Start Zookeeper Server
./bin/zookeeper-server-start.sh config/zookeeper.properties

### Start Kafka Server
./bin/kafka-server-start.sh config/server.properties

### Create a topic
./bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test-rat-kafka

### Create a Console Consumer
./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test-rat-kafka --from-beginning

### Create a Console Producer
./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test-rat-kafka