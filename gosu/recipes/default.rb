#
# Cookbook Name:: gosu
# Recipe:: default
#

%w[g++ libgl1-mesa-dev libpango1.0-dev libboost-dev libaudiere-dev libsdl-ttf2.0-dev].each do |pkg|
  package pkg
end