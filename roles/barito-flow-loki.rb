name "barito-flow-loki"
description "Barito Flow Loki"
run_list "recipe[consul]", "recipe[barito-loki::flow]", "recipe[barito-loki::flow_consul_register]"
