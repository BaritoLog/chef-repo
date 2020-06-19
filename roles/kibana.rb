name "kibana"
description "Kibana"
run_list "recipe[consul]", "recipe[kibana]", "recipe[kibana::consul_register]", "recipe[prometheus::kibana_exporter]"
