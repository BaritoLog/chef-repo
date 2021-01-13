name "barito-flow-consumer"
description "Barito Flow Consumer"
run_list "recipe[barito-flow::consumer]", "recipe[consul]", "recipe[barito-flow::consumer_consul_register]"
