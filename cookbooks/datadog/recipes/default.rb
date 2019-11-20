#
# Cookbook:: datadog-cookbook
# Recipe:: default
#
# Copyright:: 2018, BaritoLog, All Rights Reserved.

api_key = node[cookbook_name]['datadog_api_key']
hostname = node[cookbook_name]['datadog_hostname']
user = node[cookbook_name]['user']
group = node[cookbook_name]['group']
datadog_config_path = node[cookbook_name]['datadog_config_path']
datadog_agent_version = node[cookbook_name]['datadog_agent_version']
dogstatsd_port = node[cookbook_name]['datadog_dogstatsd_port']

apt_repository 'datadog' do
  uri 'https://apt.datadoghq.com/'
  components ['6']
  distribution 'stable'
  key 'A2923DFF56EDA6E76E55E492D3A80E30382E94DE'
  keyserver 'keyserver.ubuntu.com'
  action :add
  deb_src true
end

apt_update 'update'

apt_package 'apt-transport-https' do 
  action :install 
end 

apt_package 'datadog-agent' do
  options "--force-yes"
  version "1:#{datadog_agent_version}-1"
  action :install
end

template "#{datadog_config_path}/datadog.yaml" do
  source 'datadog.yaml.erb'
  owner 'dd-agent'
  group 'dd-agent'
  mode '0640'
  variables api_key: api_key, hostname: hostname, dogstatsd_port: dogstatsd_port
end

service 'datadog-agent' do
  supports start: true, enable: true, restart: true
  action [ :enable, :start ]
end
