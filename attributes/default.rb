
case node['platform']
when "amazon"
  default[:phpmyadmin][:cfg][:cfg_path]               =   '/etc/phpMyAdmin'
  default[:phpmyadmin][:cfg][:cfg_inc_path]           =   '/etc/phpMyAdmin'
  default[:phpmyadmin][:cfg][:path]                   =   '/usr/share/phpMyAdmin'
  default[:phpmyadmin][:apache2][:site_config]        =   '/etc/httpd/sites-available/phpmyadmin.conf'
when "redhat", "centos", "scientific", "fedora"
  default[:phpmyadmin][:cfg][:cfg_path]               =   '/etc/phpMyAdmin'
  default[:phpmyadmin][:cfg][:cfg_inc_path]           =   '/usr/share/phpMyAdmin'
  default[:phpmyadmin][:cfg][:path]                   =   '/usr/share/phpMyAdmin'
  default[:phpmyadmin][:apache2][:site_config]        =   '/etc/httpd/conf.d/phpMyAdmin.conf'
else
  default[:phpmyadmin][:cfg][:cfg_path]               =   '/etc/phpmyadmin'
  default[:phpmyadmin][:cfg][:cfg_inc_path]           =   '/etc/phpmyadmin'
  default[:phpmyadmin][:cfg][:path]                   =   '/usr/share/phpmyadmin'
  default[:phpmyadmin][:apache2][:site_config]        =   '/etc/phpmyadmin/apache.conf'
end

default[:phpmyadmin][:cfg][:auth_type]              =   'cookie'
default[:phpmyadmin][:cfg][:allow_root]             =   false
default[:phpmyadmin][:cfg][:allow_no_password]      =   false

default[:phpmyadmin][:cfg][:control_database]       =   'phpmyadmin'
default[:phpmyadmin][:cfg][:control_user]           =   'phpmyadmin'
default[:phpmyadmin][:cfg][:control_host]           =   '127.0.0.1'
#default[:phpmyadmin][:cfg][:control_user_password] =   '' - will be set to an automatically generated password unless specified

default[:phpmyadmin][:mysql][:user]                   =   'root'
default[:phpmyadmin][:mysql][:password]          =   ''
default[:phpmyadmin][:mysql][:host]                   =   '127.0.0.1'

default[:phpmyadmin][:webserver]                    =   'apache2'

default[:phpmyadmin][:apache2][:port]                 =   80
default[:phpmyadmin][:apache2][:server_name]          =   'phpmyadmin.yourhost.com'
default[:phpmyadmin][:apache2][:docroot]              =   default[:phpmyadmin][:cfg][:path]
default[:phpmyadmin][:apache2][:allow_ip_addresses]  =   ['127.0.0.1']

default[:phpmyadmin][:nginx][:port]                 =   80
default[:phpmyadmin][:nginx][:server_name]          =   'phpmyadmin.yourhost.com'
default[:phpmyadmin][:nginx][:docroot]              =   default[:phpmyadmin][:cfg][:path]
default[:phpmyadmin][:nginx][:fastcgi_server]       =   'unix:/dev/shm/php5-fpm.sock'
