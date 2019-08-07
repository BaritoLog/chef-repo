name "consul"
description "Consul"
run_list "recipe[consul]","recipe[prometheus::consul_exporter]"
