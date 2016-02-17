#
# Cookbook Name:: hithere
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "daemon"

cookbook_file '/usr/local/bin/hithere' do
  source 'hithere'
  owner 'nobody'
  group 'nogroup'
  mode '0755'
  action :create
end

cookbook_file '/etc/init.d/hithere' do
  source 'init'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

service "hithere" do
    supports :restart => true, :start => true, :stop => true, :reload => false
    subscribes :restart, 'cookbook_file[/usr/local/bin/hithere]'
    action [:enable, :start]
end
