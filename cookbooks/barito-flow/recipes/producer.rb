#
# Cookbook:: barito-flow
# Recipe:: producer
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
#

service_name = node[cookbook_name]['producer']['service_name']

barito_flow_service_account node[cookbook_name]['user'] do
  group node[cookbook_name]['group']
end

barito_flow_binary_install service_name do
  version node[cookbook_name]['producer']['version']
  prefix_root node[cookbook_name]['prefix_root']
  prefix_bin node[cookbook_name]['prefix_bin']
  prefix_temp node[cookbook_name]['prefix_temp']
  mirror node[cookbook_name]['producer']['mirror']
  user node[cookbook_name]['user']
  group node[cookbook_name]['group']
end

env_vars_file = node[cookbook_name]['producer']['env_vars_file']
barito_flow_env_vars_file env_vars_file do
  env_vars node[cookbook_name]['producer']['env_vars']
  user node[cookbook_name]['user']
  group node[cookbook_name]['group']
end

bin = "#{node[cookbook_name]['prefix_bin']}/#{service_name}"
barito_flow_binary_systemd service_name do
  cli_opts node[cookbook_name]['producer']['cli_opts']
  systemd_unit node[cookbook_name]['producer']['systemd_unit']
  bin bin
  env_vars_file env_vars_file
  prefix_log node[cookbook_name]['producer']['prefix_log']
  log_file_name node[cookbook_name]['producer']['log_file_name']
end
