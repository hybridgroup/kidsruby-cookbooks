#
# Cookbook Name:: kidsruby
# Recipe:: editor
#

# install the qtbindings via rvm
execute "rvm install qtbindings" do
  command "rvm default@global gem install qtbindings -q --no-rdoc --no-ri"
  action  :run
  timeout 1800
  not_if  %{bash -c "source /etc/profile.d/rvm.sh && gem list | grep -q 'qtbindings' >/dev/null"}
  environment ({"CFLAGS" => "-m32"})
end


# checkout the latest editor code from git if it doesn't exist
git node[:kidsruby][:install_path] do
  repository node[:kidsruby][:git_repo]
  branch     node[:kidsruby][:git_branch]
  action     :checkout
  not_if     "test -d #{node[:kidsruby][:install_path]}"
end

# update the latest editor code from git if it exists
git node[:kidsruby][:install_path] do
  repository node[:kidsruby][:git_repo]
  branch     node[:kidsruby][:git_branch]
  action     :sync
  only_if    "test -d #{node[:kidsruby][:install_path]}/.git"
end

# ensure all users have access to the editor
execute "ensure read-write access to #{node[:kidsruby][:install_path]}" do
  command "chmod -R 777 #{node[:kidsruby][:install_path]}"
end

# install gem dependencies
execute "bundle install dependencies" do
  command %{bash -c "#{[
    "source /etc/profile.d/rvm.sh",
    "cd #{node[:kidsruby][:install_path]}",
    "bundle"
    ].join(" && ")}"}
  action  :run
  timeout 1800
  environment ({"CFLAGS" => "-m32"})
end