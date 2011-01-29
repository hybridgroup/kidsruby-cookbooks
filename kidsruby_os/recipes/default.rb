#
# Cookbook Name:: kidsruby_os
# Recipe:: default
#

# prep the livecd iso environment
include_recipe "kidsruby_os::iso_prep"

# prepare the chroot for rebuild via chef
include_recipe "kidsruby_os::chroot_bootstrap"

# build the iso and cleanup
include_recipe "kidsruby_os::iso_build"