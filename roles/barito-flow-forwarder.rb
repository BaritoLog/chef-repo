name "barito-flow-forwarder"
description "Barito Flow Forwarder"
run_list "recipe[barito_flow::default], recipe[barito_flow::forwarder]"
