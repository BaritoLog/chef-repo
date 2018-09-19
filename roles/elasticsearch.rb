name "elasticsearch"
description "Elasticsearch"
run_list "recipe[consul]", "recipe[elasticsearch_wrapper_cookbook::elasticsearch]", "recipe[elasticsearch_wrapper_cookbook::consul_register]"
