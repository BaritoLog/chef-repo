name "kafka"
description "Kafka"
run_list "recipe[consul]", "recipe[kafka::kafka]", "recipe[kafka::kafka_consul_register]", "recipe[prometheus::kafka_exporter]"
