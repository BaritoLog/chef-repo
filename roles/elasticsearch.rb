name "elasticsearch"
description "Elasticsearch"
run_list "recipe[java::default]", "recipe[elasticsearch]"
