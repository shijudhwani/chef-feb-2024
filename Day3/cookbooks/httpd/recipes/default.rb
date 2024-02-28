#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

package "httpd" do
  case node[:platform]
  when 'redhat'
    package_name 'httpd'
  when 'ubuntu'
    package_name 'apache2'
  end
  action :install
end

=begin
file '/var/www/html/index.html' do
  content 'Httpd webserver works !'
  notifies :restart, 'service[httpd]'
end
=end

template '/var/www/html/index.html' do
  source 'index.erb'
end


service 'httpd' do
  case node['platform']
  when 'redhat'
    service_name 'httpd'
  when 'ubuntu'
    service_name 'apache2'
  end
  action [ :enable, :start ]
end
