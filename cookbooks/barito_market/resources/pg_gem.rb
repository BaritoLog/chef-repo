#
# Cookbook:: barito-market-cookbook
# Resource:: pg_gem
#
# Copyright:: 2018, BaritoLog.
#
#

property :client_version, String, default: '10'
# gem options
property :version, [String, nil], default: '1.1.2'
property :clear_sources, [true, false]
property :include_default_source, [true, false]
property :gem_binary, String
property :options, [String, Hash]
property :timeout, Integer, default: 300
property :source, String

action :install do
  apt_repository 'postgresql_org_repository' do
    uri 'https://download.postgresql.org/pub/repos/apt/'
    components   ['main', new_resource.version.to_s]
    distribution "#{node['lsb']['codename']}-pgdg"
    key 'https://download.postgresql.org/pub/repos/apt/ACCC4CF8.asc'
    cache_rebuild true
  end
  
  package %W[
    libpq5 libpq-dev postgresql-client-#{new_resource.client_version}
    libgmp-dev
  ]
  build_essential 'essentially essential' do
    compile_time true
  end
  gem_package 'pg' do
    clear_sources new_resource.clear_sources if new_resource.clear_sources
    include_default_source new_resource.include_default_source if new_resource.include_default_source
    gem_binary new_resource.gem_binary if new_resource.gem_binary
    options new_resource.options if new_resource.options
    source new_resource.source if new_resource.source
    timeout new_resource.timeout if new_resource.timeout
    version new_resource.version if new_resource.version
    action :install
  end
end
