#
# Cookbook Name:: nginx_lb
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
nginx_site 'default' do
  enable false
end

cookbook_file '/etc/nginx/conf.d/upstream.conf' do
  source 'upstream.conf'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file '/etc/nginx/sites-available/hithere' do
  source 'hithere.conf'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

nginx_site 'hithere' do
  enable true
end
