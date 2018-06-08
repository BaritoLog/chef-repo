name "elasticsearch"
description "Elasticsearch"
run_list "recipe[consul]", "recipe[elasticsearch_wrapper_cookbook]", "recipe[elasticsearch_wrapper_cookbook::consul_register]"
