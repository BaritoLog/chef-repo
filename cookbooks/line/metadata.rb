name             'line'
maintainer       'Sous Chefs'
maintainer_email 'help@sous-chefs.org'
license          'Apache-2.0'
description      'Provides line editing resources for use by recipes'

version          '2.9.1'

source_url       'https://github.com/sous-chefs/line'
issues_url       'https://github.com/sous-chefs/line/issues'
chef_version     '>= 12.13.37'

%w(debian ubuntu centos redhat scientific oracle amazon windows).each do |os|
  supports os
end
