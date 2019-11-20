#
# Cookbook:: barito-flow
# Recipe:: producer_consul_register
#
# Copyright:: 2018, BaritoLog.
#
#

config = {
  "id": "#{node['hostname']}-#{node[cookbook_name]['producer']['service_name']}",
  "name": "#{node[cookbook_name]['producer']['service_name']}",
  "tags": ["app:"],
  "address": node['ipaddress'],
  "port": 8080,
  "meta": {
    "http_schema": "http"
  }
}

checks = [
  {
    "id": "#{node['hostname']}-#{node[cookbook_name]['producer']['service_name']}-hc-tcp",
    "name": "#{node[cookbook_name]['producer']['service_name']}",
    "tcp": "#{node['ipaddress']}:8080",
    "interval": "10s",
    "timeout": "1s"
  }
]

consul_register_service "#{node[cookbook_name]['producer']['service_name']}" do
  config config
  checks checks
  config_dir  node[cookbook_name]['consul']['config_dir']
  consul_bin  node[cookbook_name]['consul']['bin']
end
