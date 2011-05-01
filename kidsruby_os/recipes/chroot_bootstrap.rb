#
# Cookbook Name:: kidsruby_os
# Recipe:: chroot_bootstrap
#

# make sure the customization-scripts directory exists
directory "#{node[:kidsruby_os][:remaster_root]}/customization-scripts" do
  owner  "root"
  group  "root"
  action :create
end

# setup bootstrap files inside the chroot
%w[chroot-bootstrap.sh chef-bootstrap.sh].each do |file|
  cookbook_file "#{node[:kidsruby_os][:remaster_root]}/customization-scripts/#{file}" do
    source file
    owner  "root"
    group  "root"
    mode   "0755"
    action :create
  end
end

# prime rvm profile helper
template "#{node[:kidsruby_os][:remaster_root]}/remaster-root/etc/profile.d/rvm.sh" do
  source "rvm.sh.erb"
  owner  "root"
  group  "root"
  mode   "0755"
  action :create
end

# copy the host chef configuration to the chroot
execute "Copy Chef to the chroot" do
  command [
    "rm -rf #{node[:kidsruby_os][:remaster_root]}/customization-scripts/chef/",
    "cp -R #{node[:kidsruby_os][:chef_directory]} #{node[:kidsruby_os][:remaster_root]}/customization-scripts/"
  ].join(" && ")
end

# update paths and role for chroot
execute "update chef configuration paths in the chroot" do
  command "sed -i 's/role\\[ec2_host\\]/role\\[livecd\\]/' #{node[:kidsruby_os][:remaster_root]}/customization-scripts/chef/config/dna.json"
  environment ({"CFLAGS" => "-m32"})
end

execute "bootstrap and run chef within the chroot" do
  command "#{node[:kidsruby_os][:remaster_root]}/customization-scripts/chroot-bootstrap.sh"
  environment ({"CFLAGS" => "-m32"})
end