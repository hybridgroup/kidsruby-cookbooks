#
# Cookbook Name:: kidsruby
# Recipe:: system
#

# set the system bashrc file
cookbook_file "/etc/bash/bashrc.local" do
  source "bashrc.local"
  owner "root"
  group "root"
  mode 0644
end

# configure the default desktop settings via /etc/skel
remote_directory "/etc/skel/.config" do
  source "xfce4-config"
  files_owner "root"
  files_group "root"
  files_mode "0644"
  owner "root"
  group "root"
  mode "0755"
end

# place ruby icons
remote_directory "/usr/share/icons/ruby-inside-icons" do
  source "ruby-inside-icons"
  owner "root"
  group "root"
  mode "0755"
end