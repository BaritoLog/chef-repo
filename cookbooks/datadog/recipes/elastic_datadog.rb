#
# Cookbook:: datadog-cookbook
# Recipe:: elastic_datadog
#
# Copyright:: 2018, BaritoLog.
#
#

template "/etc/datadog-agent/conf.d/elastic.d/conf.yaml" do
  source "datadog.elastic.conf.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['elastic']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end
