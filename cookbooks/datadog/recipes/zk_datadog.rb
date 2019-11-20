#
# Cookbook:: datadog-cookbook
# Recipe:: zk_datadog
#
# Copyright:: 2018, BaritoLog.
#
#

template "/etc/datadog-agent/conf.d/zk.d/conf.yaml" do
  source "datadog.zk.conf.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['zk']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end
