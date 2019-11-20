#
# Cookbook:: datadog-cookbook
# Recipe:: postgres_datadog
#
# Copyright:: 2018, BaritoLog.
#
#

template "/etc/datadog-agent/conf.d/postgres.d/conf.yaml" do
  source "datadog.postgres.conf.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['postgres']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end
