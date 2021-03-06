kibana5_install 'kibana' do
  version node['kibana']['version']
  install_method 'release'
  base_dir node['kibana']['config']['base_dir']
  svc_user node['kibana']['service_user']
end

kibana5_configure 'kibana' do
  svc_name 'kibana'
  configuration ({
    'elasticsearch.url' => node['kibana']['config']['elasticsearch.url'],
    'server.basePath' => node['kibana']['config']['server.basePath'],
    'logging.dest' => node['kibana']['config']['logging.dest'],
    'xpack.security.enabled' => node['kibana']['config']['xpack.security.enabled']
  })
end

template '/etc/logrotate.d/kibana' do
  source 'logrotate/kibana.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables log_file: node['kibana']['config']['logging.dest']
end

apt_update 'update_to_install_nginx'
package 'nginx'

apt_package 'libnginx-mod-http-lua'
apt_package 'lua-cjson'

template node['nginx']['kibana_path'] do
  source 'nginx.conf.erb'
  variables(
    listen_address: node['nginx']['ip_address'],
    listen_port: node['nginx']['port'],
    server_name: 'kibana',
    kibana_port: node['kibana']['config']['port'],
    base_path: node['kibana']['config']['server.basePath'],
    message_format: node['kibana']['config']['message_format'],
    tps_banner_prometheus_query_url: node['kibana']['config']['prometheus_url'] + "/api/v1/query?query=" +
      URI::encode("increase(barito_producer_tps_exceeded_total{app_group=\"#{node['kibana']['config']['server.basePath'][1..-1]}\"}[1m]) > 0")
  )
  notifies :reload, 'service[nginx]'
end

%w[sites-enabled sites-available conf.d].each do |conf_dir|
  file "/etc/nginx/#{conf_dir}/default" do
    action :delete
    notifies :reload, 'service[nginx]'
  end
end

systemd_service 'kibana' do
  unit do
    description 'Kibana'
  end
  service do
    type 'simple'
    user node['kibana']['service_user']
    environment 'NODE_ENV=production'
    exec_start "/opt/kibana/#{node['kibana']['version']}/current/bin/kibana"
  end
  install do
    wanted_by 'multi-user.target'
  end
end

service 'nginx' do
  supports start: true, enable: true, restart: true
end

service 'kibana' do
  supports start: true, restart: true, stop: true, status: true
  action [:enable, :restart]
end