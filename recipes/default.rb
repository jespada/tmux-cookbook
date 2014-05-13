#
# Cookbook Name:: tmux-coobook
# Recipe:: default
#
# Copyright (C) 2014, Jorge Espada
#
#

# Example to show external dependencies (depends 'foo') on metadata.rb
# include_recipe 'foo'


begin
  include_recipe "tmux::#{node['tmux']['install_method']}"
rescue Chef::Exceptions::RecipeNotFound
  Chef::Application.fatal! "'#{node['tmux']['install_method']}' is not a valid installation method for the tmux cookbook!"
end

template '/etc/tmux.conf' do
  source 'tmux.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    :server_opts  => node['tmux']['server_opts'].to_hash,
    :session_opts => node['tmux']['session_opts'].to_hash,
    :window_opts  => node['tmux']['window_opts'].to_hash
  )
end
