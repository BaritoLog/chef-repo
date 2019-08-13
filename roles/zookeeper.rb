name "zookeeper"
description "Zookeeper"
run_list "recipe[consul]", "recipe[zookeeper]", "recipe[zookeeper::consul_register]","recipe[prometheus::zookeeper_exporter]"
