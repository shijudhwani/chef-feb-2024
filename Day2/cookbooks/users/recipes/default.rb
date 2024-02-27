#
# Cookbook:: users
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.
#
#
#
group 'user1' do
  gid '1234'           
  group_name 'user1' 
end

user 'user1' do
  uid '1234' 
  gid '1234'
  home '/home/user1'
  shell '/bin/bash'
  password '$6$lRCWsr16lT2qf//i$yIV8QgwNuUuMOFqNJlDIkt8UhGgsa7XGksgnESAy49CHom.HweW/NwKJ3e0oMbwDJdKNhgKk807IDO3SuE9j4/'
end
