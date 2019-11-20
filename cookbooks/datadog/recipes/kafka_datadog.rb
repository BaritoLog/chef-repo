#
# Cookbook:: datadog-cookbook
# Recipe:: kafka_datadog
#
# Copyright:: 2018, BaritoLog.
#
#

template "/etc/datadog-agent/conf.d/kafka.d/conf.yaml" do
  source "datadog.kafka.conf.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['kafka']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end
