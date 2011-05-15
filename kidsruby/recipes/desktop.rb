#
# Cookbook Name:: kidsruby
# Recipe:: desktop
#

package "xubuntu-artwork"
package "xubuntu-icon-theme"

# setup the default desktop folder for users
directory "/etc/skel/Desktop" do
  owner "root"
  group "root"
  mode  "0755"
  action :create
end

# prepare the kidsruby desktop shortcut
cookbook_file "/etc/skel/Desktop/KidsRuby.desktop" do
  source "KidsRuby.desktop"
  owner "root"
  group "root"
  mode "0644"
end

# setup the directory where wallpaper is stored
directory "/usr/share/wallpapers" do
  owner "root"
  group "root"
  mode  "0755"
  action :create
end

# prepare the kidsruby desktop wallpaper
cookbook_file "/usr/share/wallpapers/kidsruby-desktop-background.png" do
  source "kidsruby-desktop-background.png"
  owner "root"
  group "root"
  mode "0755"
end