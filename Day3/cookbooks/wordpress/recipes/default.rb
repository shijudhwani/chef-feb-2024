#
# Cookbook:: wordpress
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.
#

unless platform?(%w{ubuntu})
  include_recipe "::configure-mysql-server-on-redhat"
end
unless platform?(%w{redhat})
 include_recipe "::configure-mysql-server-on-ubuntu"
end
include_recipe "::install-wordpress"
include_recipe "::configure-wordpress-with-mysql-credentials"


