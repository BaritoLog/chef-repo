#
# Cookbook:: barito-market-cookbook
# Recipe:: app_rails
#
# Copyright:: 2018, BaritoLog.
#
#

app_name = cookbook_name
user = node[cookbook_name]['user']
group = node[cookbook_name]['group']
env = node[cookbook_name]['env']
install_directory = node[cookbook_name]['install_directory']
shared_directory = node[cookbook_name]['shared_directory']

execute 'run bundle install' do
  user user
  group group
  command "bundle install --path #{shared_directory}/.local --without development:test"
  cwd "#{install_directory}/BaritoMarket"
end

execute 'setup database' do
  user user
  group group
  command "
    RAILS_ENV=#{env} bin/rake db:migrate && \
    RAILS_ENV=#{env} bin/rake assets:precompile
  "
  cwd "#{install_directory}/BaritoMarket"
end

service "#{app_name}" do
  subscribes :restart, 'execute[setup database]', :delayed
end

service 'sidekiq' do
  subscribes :restart, 'execute[setup database]', :delayed
end
