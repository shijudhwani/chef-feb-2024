#
# Cookbook:: mysql
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.
#
package "install mysql" do
  package_name 'mysql-server'
  action :install
end

service 'enable and start mysql service' do
  case node['platform']
  when 'redhat'
    service_name 'mysqld'
  when 'ubuntu'
    service_name 'mysql'
  end
  action [ :enable, :start ]
  #action [ :nothing ]
end


