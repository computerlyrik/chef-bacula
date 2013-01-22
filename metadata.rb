maintainer       "computerlyrik"
maintainer_email "chef-cookbooks@computerlyrik.de"
license          "Apache 2.0"
description      "Installs and autoconfigures bacula backup system"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.1"

%w{ ubuntu debian}.each do |os|
  supports os
end

%w{ openssl database }.each do |dep|
  depends dep
end
