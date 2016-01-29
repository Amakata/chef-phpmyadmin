include_recipe "apache2"

web_app "phpmyadmin" do
    template 'apache2/web_app.conf.erb'
    server_name node[:phpmyadmin][:apache2][:server_name]
    server_port node[:phpmyadmin][:apache2][:port]
    docroot node[:phpmyadmin][:apache2][:docroot]
    allow_ip_addresses node[:phpmyadmin][:apache2][:allow_ip_addresses]
end

apache_site "phpmyadmin"
