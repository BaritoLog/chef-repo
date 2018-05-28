name "zookeeper"
description "Zookeeper"
run_list "recipe[consul]", "recipe[zookeeper]", "recipe[consul::register]"
