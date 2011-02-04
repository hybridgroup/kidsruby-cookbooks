#
# Cookbook Name:: wifi-networking
# Recipe:: default
#

%w[network-manager network-config wpasupplicant wpagui].each do |pkg|
  package pkg
end

service "network-manager" do
  supports :restart => true
  action [ :enable, :start ]
end