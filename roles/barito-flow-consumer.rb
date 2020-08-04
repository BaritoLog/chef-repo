name "barito-flow-consumer"
description "Barito Flow Consumer"
run_list "recipe[consul]", "recipe[barito-flow::consumer_consul_register]", "recipe[barito-flow::consumer]"
