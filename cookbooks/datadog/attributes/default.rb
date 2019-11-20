cookbook_name = 'datadog'

default[cookbook_name]['datadog_api_key'] = ENV['BARITO_DATADOG_API_KEY']
default[cookbook_name]['datadog_hostname'] = ''
default[cookbook_name]['datadog_config_path'] = '/etc/datadog-agent'
default[cookbook_name]['datadog_agent_version'] = '6.5.2'
default[cookbook_name]['datadog_dogstatsd_port'] = '8125'
