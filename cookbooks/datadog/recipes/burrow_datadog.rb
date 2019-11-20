#
# Cookbook:: datadog-cookbook
# Recipe:: burrow_datadog
#
# Copyright:: 2018, BaritoLog.
#
#

template '/etc/datadog-agent/conf.d/burrow.yaml' do
  source 'datadog.burrow.conf.yaml.erb'
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables(instances: node[cookbook_name]['burrow']['instances'])
  notifies :restart, 'service[datadog-agent]', :delayed
  only_if 'dpkg -l | grep datadog'
end

cookbook_file '/etc/datadog-agent/checks.d/burrow.py' do
  source 'datadog.burrow.py'
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  notifies :restart, 'service[datadog-agent]', :delayed
  only_if 'dpkg -l | grep datadog'
end
