name "Loki"
description "Barito Loki"
run_list "recipe[consul]", "recipe[barito-loki::loki]", "recipe[barito-loki::loki_consul_register]"
