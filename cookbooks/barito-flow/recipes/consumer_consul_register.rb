#
# Cookbook:: barito-flow
# Recipe:: consumer_consul_register
#
# Copyright:: 2018, BaritoLog.
#
#

config = {
  "id": "#{node['hostname']}-#{node[cookbook_name]['consumer']['service_name']}",
  "name": "#{node[cookbook_name]['consumer']['service_name']}",
  "tags": ["app:"],
  "address": node['ipaddress'],
  "port": 8080,
  "meta": {
    "http_schema": "http"
  }
}

consul_register_service "#{node[cookbook_name]['consumer']['service_name']}" do
  config config
  config_dir  node[cookbook_name]['consul']['config_dir']
  consul_bin  node[cookbook_name]['consul']['bin']
end
