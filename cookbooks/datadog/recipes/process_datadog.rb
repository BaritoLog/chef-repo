#
# Cookbook:: datadog-cookbook
# Recipe:: process_datadog
#
# Copyright:: 2018, BaritoLog.
#
#

template "/etc/datadog-agent/conf.d/process.d/conf.yaml" do
  source "datadog.process.conf.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['process']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end
