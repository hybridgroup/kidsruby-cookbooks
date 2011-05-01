#
# Cookbook Name:: kidsruby
# Recipe:: default
#

package "smbios-utils"

# setup system components
include_recipe "kidsruby::system"

# customize the OS desktop
include_recipe "kidsruby::desktop"

# install the editor
include_recipe "kidsruby::editor"