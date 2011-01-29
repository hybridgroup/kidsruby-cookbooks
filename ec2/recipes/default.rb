execute "Kill dhclient" do
  command "kill #{File.read("/var/run/dhclient.eth0.pid").chomp}"
  only_if "pgrep dhclient"
end

bash "Add hosts entry for current node" do
  code "echo '#{node[:ipaddress]} #{node[:host]}' >> /etc/hosts"
  not_if "grep '#{node[:ipaddress]} #{node[:host]}' /etc/hosts"
end

bash "Set domain name file" do
  code "echo #{node[:domain]} /etc/domainname"
  not_if "grep #{node[:domain]} /etc/domainname"
end

bash "Set hostname file" do
  code "echo #{node[:host]} > /etc/hostname"
  not_if "grep #{node[:host]} /etc/hostname"
end

bash "Set mailname for postfix" do
  code "echo #{node[:host]} > /etc/mailname"
  not_if "grep #{node[:host]} /etc/mailname"
end

execute "Set hostname" do
  command "/bin/hostname #{node[:host]}"
  only_if { `hostname -f` != node[:host] }
end

execute "Set domainname" do
  command "/bin/domainname #{node[:domain]}"
  only_if { `domainname` != node[:domain] }
end