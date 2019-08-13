name "kibana"
description "Kibana"
run_list "recipe[consul]", "recipe[kibana_wrapper_cookbook]", "recipe[kibana_wrapper_cookbook::consul_register]","recipe[prometheus::kibana_exporter]"
