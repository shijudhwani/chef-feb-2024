file '/tmp/test.txt' do
  content "#{node['platform']} #{node['languages']['ruby']['version']}"
end
