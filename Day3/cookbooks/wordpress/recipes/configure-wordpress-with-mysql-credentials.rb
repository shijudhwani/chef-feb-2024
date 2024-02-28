template "#{node['wordpress']['dir']}/wp-config.php" do
  source "wp-config.php.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :database        => node['wordpress']['db']['name'],
    :user            => node['wordpress']['db']['user'],
    :password        => node['wordpress']['db']['password'],
    :auth_key        => node['wordpress']['keys']['auth'],
    :secure_auth_key => node['wordpress']['keys']['secure_auth'],
    :logged_in_key   => node['wordpress']['keys']['logged_in'],
    :nonce_key       => node['wordpress']['keys']['nonce']
  )
  notifies :write, "log[Navigate to 'http://#{node['fqdn']}/wp-admin/install.php' to complete wordpress installation]"
end

log "Navigate to 'http://#{node['fqdn']}/wp-admin/install.php' to complete wordpress installation" do
  action :nothing
end

unless platform?(%w{redhat})
  execute "create #{node['wordpress']['db']['database']} database" do
    command "echo "CREATE DATABASE #{node['wordpress']['db']['name'] | /usr/bin/mysql -u root -p #{node['mysql']['root_password']}"
  end
end

unless platform?(%w{ubuntu})
  execute "create #{node['wordpress']['db']['database']} database" do
    command "echo "CREATE DATABASE #{node['wordpress']['db']['name'] | /usr/bin/mysql -u root"
  end
end
