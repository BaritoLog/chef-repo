name "barito-flow-producer"
description "Barito Flow Producer"
run_list "recipe[consul]", "recipe[barito-flow::producer_consul_register]", "recipe[barito-flow::producer]"
