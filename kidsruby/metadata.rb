maintainer        "KidsRuby"
maintainer_email  "cookbooks@kidsruby.com"
license           "Apache 2.0"
description       "Install the KidsRuby learning environment"
version           "0.1.0"
supports          "ubuntu"
recipe            "default", "Install the KidsRuby learning environment"

# dependencies
%w[git rvm libqt4 xfce4].each do |pkg|
  depends pkg
end

# required attributes
attribute 'kidsruby/install_path',
  :display_name => "Installation path",
  :description  => "The path where the editor project will be installed",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby::default" ],
  :default      => "/opt/kidsruby"

attribute 'kidsruby/git_repo',
  :display_name => "Git repository",
  :description  => "The path to the hosted Git repository",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby::default" ],
  :default      => "git://github.com/hybridgroup/kidsruby.git"

attribute 'kidsruby/git_branch',
  :display_name => "Git branch",
  :description  => "The branch to checkout from the hosted Git repository",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby::default" ],
  :default      => "release"