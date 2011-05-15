#
# Cookbook Name:: virtualbox
# Recipe:: default
#

template "/etc/apt/sources.list.d/virtualbox.list" do
  mode 0644
  variables :code_name => node[:lsb][:codename]
  notifies :run, resources(:execute => "apt-get update"), :immediately
  source "virtualbox.list.erb"
end

execute "install virtualbox apt gpg key" do
  command "wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -"
  not_if "apt-key list | grep -i virtualbox"
end

%w[
  smbios-utils libsmbios2
  virtualbox-guest-additions virtualbox-ose-guest-utils
  virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms
].each do |pkg|
  package pkg
end