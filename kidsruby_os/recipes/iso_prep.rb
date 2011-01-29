#
# Cookbook Name:: kidsruby_os
# Recipe:: iso_prep
#

# ensure the working directory exists
directory node[:kidsruby_os][:iso_directory] do
  owner  "root"
  group  "root"
  mode   "0755"
  action :create
end

# download the iso to remaster
remote_file "#{node[:kidsruby_os][:iso_directory]}/#{node[:kidsruby_os][:remaster_iso]}" do
  source node[:kidsruby_os][:remaster_iso_url]
  mode "0755"
  action :create_if_missing
end

# prepare for remaster
execute "Clean the uck environment" do
  command "uck-remaster-clean"
end

# unpack iso
execute "Unpack ISO" do
  command "uck-remaster-unpack-iso #{node[:kidsruby_os][:iso_directory]}/#{node[:kidsruby_os][:remaster_iso]}"
end

# extract rootfs
execute "Unpack the rootfs" do
  command "uck-remaster-unpack-rootfs"
end