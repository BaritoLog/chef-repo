name "grafana"
description "Grafana"
run_list "recipe[consul]", "recipe[barito-loki::grafana]", "recipe[barito-loki::grafana_consul_register]"
