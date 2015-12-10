
sql_path = '/tmp/phpmyadmin_create_tables.sql'

template sql_path do
  source "mysql/create_tables.sql.erb"
  owner "root"
  group node['mysql']['root_group']
  mode "0600"
  action :create
end

execute "phpmyadmin-create-tables" do
  command "\"#{node['phpmyadmin']['mysql']['bin']}\" -u #{node['phpmyadmin']['mysql']['user']} -h #{node['phpmyadmin']['mysql']['host']} #{node['phpmyadmin']['mysql']['password'].empty? ? '' : '-p' }\"#{node['phpmyadmin']['mysql']['password']}\" < \"#{sql_path}\""
end

file sql_path do
  action :delete
  only_if { File.exists?(sql_path) }
end
