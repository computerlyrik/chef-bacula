default['bacula']['fd']['address'] = node['ipaddress']

## AUTODETECT BACKUPABLE DATA

# ZARAFA
if node['zarafa']
  node.set['bacula']['fd']['files'] = {
    'includes' => [
      '/var/lib/zarafa',
      '/usr/share/zarafa',
      '/usr/share/httpd.conf',
      '/etc/postfix',
      '/etc/default/saslauthd',
      '/etc/zarafa',
      '/etc/apache2/httpd.conf'
    ]
  }
end

# GITHUB BACKUP
if node['github-backup']
  node.set['bacula']['fd']['files'] = {
    'includes' => [node['github-backup']['backup_dir']]
  }
end

# GITLAB
if node['gitlab']
  node.set['bacula']['fd']['files'] = {
    'includes' => [
      node['gitlab']['home'],
      '/var/lib/redis'
    ]
  }
end

# SPARKLESHARE
if node['sparkleshare'] && node['sparkleshare']['dashboard']
  node.set['bacula']['fd']['files'] = {
    'includes' => [
      node['sparkleshare']['dashboard']['dir']
    ]
  }
end

# FIREFOX
unless node['ff_sync'].nil?
  node.set['bacula']['fd']['files'] = {
    'includes' => [
      node['ff_sync']['server_dir']
    ]
  }
end

#--------------------Collectd----------------#
# COLLECTD::DEFAULT
if node['collectd']
  node.set['bacula']['fd']['files'] = {
    'includes' => [
      default['collectd']['base_dir'],
      default['collectd']['plugin_dir'],
      default['collectd']['types_db']
    ]
  }
# COLLECTD::WEB
  if node['collectd']['collectd_web']
    node.set['bacula']['fd']['files'] = {
      'includes' => [
        default['collectd']['collectd_web']['path']
      ]
    }
  end
end

# CHEF-SERVER

# if is chef server #TODO
#   node.set['bacula']['fd']['files'] = {
#     'includes' => ['/var/lib/chef', '/etc/chef/etc/couchdb']
#   }
# end
