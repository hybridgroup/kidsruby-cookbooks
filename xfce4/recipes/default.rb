#
# Cookbook Name:: xfce4
# Recipe:: default
#

%w[xfce4 xfce4-goodies xfce4-terminal].each do |pkg|
  package pkg
end