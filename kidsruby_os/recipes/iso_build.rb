#
# Cookbook Name:: kidsruby_os
# Recipe:: iso_build
#

# repack the filesystem
execute "Pack the rootfs" do
  command "uck-remaster-pack-rootfs"
end

# create the new iso
execute "Pack new ISO" do
  command "uck-remaster-pack-iso #{node[:kidsruby_os][:iso_directory]}/KidsRuby-OS-#{node[:kidsruby_os][:livecd_version]}.iso"
end