#
# Cookbook Name:: gosu
# Recipe:: default
#

%w[
    g++ libgl1-mesa-dev libpango1.0-dev libboost-dev libaudiere-dev
    libsdl-ttf2.0-dev libsdl-mixer1.2 libsdl-mixer1.2-dev
    libfreeimage3 libfreeimage-dev
  ].each do |pkg|
  package pkg
end