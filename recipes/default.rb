#
# Cookbook Name:: frBase
# Recipe:: default
#
# Copyright (c) 2015 Fast Robot, LLC, Apachev2.


include_recipe 'frUser'

# yes, I hate that I'm writing :verify_peer as a string so it will render as a symbol
node.default[:chef_client][:config][:ssl_verify_mode] = ':verify_peer'

# chef-client run out of cron
package 'cron' if node[:platform_family] == 'debian'

include_recipe 'chef-client::cron'
# manage the client.rb
include_recipe 'chef-client::config'
# some utility packages
include_recipe '::packages'

edit_resource(:link, '/usr/local/sbin/node_exporter') do
  to "/opt/node_exporter-#{node['prometheus_exporters']['node']['version']}.#{node['prometheus_exporters']['node']['os_arch']}/node_exporter"
end

node_exporter 'main' do
  action [:enable, :start]
end

#edit_resource(:link, '/usr/local/sbin/node_exporter') do
#  to "/opt/node_exporter-#{node['prometheus_exporters']['node']['version']}.#{node['prometheus_exporters']['node']['os_arch']}/node_exporter"
#end

# has a bogus hardcoded arch link
#link '/usr/local/sbin/node_exporter' do
#  to "/opt/node_exporter-#{node['prometheus_exporters']['node']['version']}.linux-amd64/node_exporter"
#end
