default['bacula']['user'] = "bacula"
default['bacula']['group'] = "bacula"

default['bacula']['messages']['mail'] = "bacula@#{node['domain']}"
default['bacula']['messages']['operator'] = node['bacula']['messages']['mail']
