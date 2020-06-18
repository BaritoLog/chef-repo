name "kibana"
description "Kibana"
run_list "recipe[consul]", "recipe[kibana]", "recipe[kibana::consul_register]", "recipe[kibana::elastalert]", "recipe[prometheus::kibana_exporter]"
