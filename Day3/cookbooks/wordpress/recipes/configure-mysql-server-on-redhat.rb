execute "mysql-install-wp-privileges" do
  command "/usr/bin/mysql -u root \" < #{node['redhat']['mysql']['conf_dir']}/wp-grants.sql"
  action :nothing
end

template "#{node['redhat']['mysql']['conf_dir']}/wp-grants.sql" do
  source "grants.sql.erb"
  owner "root"
  group "root"
  mode "0600"
  variables(
    :user     => node['wordpress']['db']['user'],
    :password => node['wordpress']['db']['password'],
    :database => node['wordpress']['db']['name']
  )
  notifies :run, "execute[mysql-install-wp-privileges]", :immediately
end
