name "zookeeper"
description "Zookeeper"
run_list "recipe[consul]", "recipe[zookeeper]"
