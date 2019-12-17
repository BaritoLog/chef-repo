#
# Cookbook:: barito-flow
# Attribute:: default
#
# Copyright:: 2018, BaritoLog.
#
#

cookbook_name = 'barito-flow'

# User and group of service process
default[cookbook_name]['user'] = 'barito'
default[cookbook_name]['group'] = 'barito'

# Temp directory
default[cookbook_name]['prefix_temp'] = '/var/cache/chef'
# Installation directory
default[cookbook_name]['prefix_root'] = '/opt'
# Where to link binaries
default[cookbook_name]['prefix_bin'] = '/opt/bin'

# Attributes for registering these services to consul
default[cookbook_name]['consul']['config_dir'] = '/opt/consul/etc'
default[cookbook_name]['consul']['bin'] = '/opt/bin/consul'
default['consul']['cli_opts'] = {
  'config-dir' => default[cookbook_name]['consul']['config_dir'],
  'enable-script-checks' => nil,
}

#
# Producer
#

# producer version
default[cookbook_name]['producer']['version'] = 'v0.8.0'
producer_version = node[cookbook_name]['producer']['version']

# where to get the binary
default[cookbook_name]['producer']['binary'] = 'barito-flow-linux'
producer_binary = node[cookbook_name]['producer']['binary']
default[cookbook_name]['producer']['mirror'] =
  "https://github.com/BaritoLog/barito-flow/releases/download/#{producer_version}/#{producer_binary}"
default[cookbook_name]['producer']['service_name'] = 'barito-flow-producer'

# environment variables
default[cookbook_name]['producer']['prefix_env_vars'] = '/etc/default'
default[cookbook_name]['producer']['env_vars_file'] = "#{node[cookbook_name]['producer']['prefix_env_vars']}/#{node[cookbook_name]['producer']['service_name']}"
default[cookbook_name]['producer']['env_vars'] = {}

# producer daemon options, used to create the ExecStart option in service
default[cookbook_name]['producer']['cli_opts'] = ['p']

# log file location
default[cookbook_name]['producer']['prefix_log'] = '/var/log/barito-flow-producer'
default[cookbook_name]['producer']['log_file_name'] = 'error.log'

# producer Systemd service unit, include config
default[cookbook_name]['producer']['systemd_unit'] = {
  'Unit' => {
    'Description' => 'barito producer',
    'After' => 'network.target',
    'StartLimitInterval' => 200,
    'StartLimitBurst' => 6
  },
  'Service' => {
    'Type' => 'simple',
    'User' => node[cookbook_name]['user'],
    'Group' => node[cookbook_name]['group'],
    'Restart' => 'on-failure',
    'RestartSec' => 5,
    'ExecStart' => 'TO_BE_COMPLETED'
  },
  'Install' => {
    'WantedBy' => 'multi-user.target'
  }
}

#
# Consumer
#

# consumer version
default[cookbook_name]['consumer']['version'] = 'v0.8.0'
consumer_version = node[cookbook_name]['consumer']['version']

# where to get the binary
default[cookbook_name]['consumer']['binary'] = 'barito-flow-linux'
consumer_binary = node[cookbook_name]['consumer']['binary']
default[cookbook_name]['consumer']['mirror'] =
  "https://github.com/BaritoLog/barito-flow/releases/download/#{consumer_version}/#{consumer_binary}"
default[cookbook_name]['consumer']['service_name'] = 'barito-flow-consumer'

# environment variables
default[cookbook_name]['consumer']['prefix_env_vars'] = '/etc/default'
default[cookbook_name]['consumer']['env_vars_file'] = "#{node[cookbook_name]['consumer']['prefix_env_vars']}/#{node[cookbook_name]['consumer']['service_name']}"
default[cookbook_name]['consumer']['env_vars'] = {}

# consumer daemon options, used to create the ExecStart option in service
default[cookbook_name]['consumer']['cli_opts'] = ['c']

# log file location
default[cookbook_name]['consumer']['prefix_log'] = '/var/log/barito-flow-consumer'
default[cookbook_name]['consumer']['log_file_name'] = 'error.log'

# consumer Systemd service unit, include config
default[cookbook_name]['consumer']['systemd_unit'] = {
  'Unit' => {
    'Description' => 'barito consumer',
    'After' => 'network.target'
  },
  'Service' => {
    'Type' => 'simple',
    'User' => node[cookbook_name]['user'],
    'Group' => node[cookbook_name]['group'],
    'Restart' => 'always', 
    'RestartSec' => 30,
    'StartLimitInterval' => 400,
    'StartLimitBurst' => 10,
    'ExecStart' => 'TO_BE_COMPLETED'
  },
  'Install' => {
    'WantedBy' => 'multi-user.target'
  }
}

#
# Router
#

# router version
default[cookbook_name]['router']['version'] = 'v0.3.1'
router_version = node[cookbook_name]['router']['version']

# where to get the binary
default[cookbook_name]['router']['binary'] = 'barito-router-linux'
router_binary = node[cookbook_name]['router']['binary']
default[cookbook_name]['router']['mirror'] =
  "https://github.com/BaritoLog/barito-router/releases/download/#{router_version}/#{router_binary}"
default[cookbook_name]['router']['service_name'] = 'barito-router'

# environment variables
default[cookbook_name]['router']['prefix_env_vars'] = '/etc/default'
default[cookbook_name]['router']['env_vars_file'] = "#{node[cookbook_name]['router']['prefix_env_vars']}/#{node[cookbook_name]['router']['service_name']}"
default[cookbook_name]['router']['env_vars'] = {}

# router daemon options, used to create the ExecStart option in service
default[cookbook_name]['router']['cli_opts'] = ['a']

# log file location
default[cookbook_name]['router']['prefix_log'] = '/var/log/barito-router'
default[cookbook_name]['router']['log_file_name'] = 'error.log'

# router Systemd service unit, include config
default[cookbook_name]['router']['systemd_unit'] = {
  'Unit' => {
    'Description' => 'barito router',
    'After' => 'network.target'
  },
  'Service' => {
    'Type' => 'simple',
    'User' => node[cookbook_name]['user'],
    'Group' => node[cookbook_name]['group'],
    'Restart' => 'always', 
    'RestartSec' => 30,
    'StartLimitInterval' => 400,
    'StartLimitBurst' => 10,
    'ExecStart' => 'TO_BE_COMPLETED'
  },
  'Install' => {
    'WantedBy' => 'multi-user.target'
  }
}
