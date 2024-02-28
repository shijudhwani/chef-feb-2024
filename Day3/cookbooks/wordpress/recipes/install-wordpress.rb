#
# Cookbook:: wordpress
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.
#

remote_file "/tmp/latest.tar.gz" do
  source "https://wordpress.org/latest.tar.gz" 
  mode "0644"
end

execute "download-wordpress" do
  cwd "/tmp"
  command "wget https://wordpress.org/latest.tar.gz" 
end

execute "extract-wordpress-compressed-file" do
   cwd "/tmp"
   command "tar xvfz latest.tar.gz"  
end
