#
# Cookbook Name:: tmux-cookbook
# Recipe:: source
#

packages = case node['platform_family']
           when 'rhel'
             %w(libevent-devel ncurses-devel gcc make)
           else
             %w(libevent-dev libncurses5-dev gcc make)
           end

packages.each do |name|
  package name
end

tar_name = "tmux-#{node['tmux']['version']}"
remote_file "#{Chef::Config['file_cache_path']}/#{tar_name}.tar.gz" do
  source "http://downloads.sourceforge.net/tmux/#{tar_name}.tar.gz"
  checksum node['tmux']['checksum']
  notifies :run, 'bash[install_tmux]', :immediately
end

bash 'install_tmux' do
  user 'root'
  cwd Chef::Config['file_cache_path']
  code <<-EOH
      tar -zxf #{tar_name}.tar.gz
      cd #{tar_name}
      ./configure #{node['tmux']['configure_options'].join(' ')}
      make
      make install
    EOH
  action :nothing
end
