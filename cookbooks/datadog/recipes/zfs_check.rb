#
# Cookbook:: datadog-cookbook
# Recipe:: zfs_check
#
# Copyright:: 2018, BaritoLog.
#
#

cookbook_file "/etc/datadog-agent/checks.d/zfs_free.py" do
  source "datadog.zfs_free.py"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  notifies :restart, 'service[datadog-agent]', :delayed
end

template "/etc/datadog-agent/conf.d/zfs_free.yaml" do
  source "datadog.zfs_free.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_free']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end

cookbook_file "/etc/datadog-agent/checks.d/zfs_used.py" do
  source "datadog.zfs_used.py"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  notifies :restart, 'service[datadog-agent]', :delayed
end

template "/etc/datadog-agent/conf.d/zfs_used.yaml" do
  source "datadog.zfs_used.yaml.erb"
  owner node[cookbook_name]['user']
  group node[cookbook_name]['group']
  mode '0644'
  variables instances: node[cookbook_name]['zfs_used']['instances']
  notifies :restart, 'service[datadog-agent]', :delayed
end
