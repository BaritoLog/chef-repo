name "barito-flow-receiver"
description "Barito Flow Receiver"
run_list "recipe[barito_flow::default], recipe[barito_flow::receiver]"
