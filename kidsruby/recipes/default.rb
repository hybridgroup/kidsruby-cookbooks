#
# Cookbook Name:: kidsruby
# Recipe:: default
#

# setup system components
include_recipe "kidsruby::system"

# customize the OS desktop
include_recipe "kidsruby::desktop"

# install the editor
include_recipe "kidsruby::editor"

# setup for use as virtualbox guest
include_recipe "kidsruby::virtualbox"