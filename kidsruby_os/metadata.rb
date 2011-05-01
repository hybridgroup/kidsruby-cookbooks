maintainer        "KidsRuby"
maintainer_email  "cookbooks@kidsruby.com"
license           "Apache 2.0"
description       "KidsRuby OS build host"
version           "0.1.1"
supports          "ubuntu"

%w[uck squashfs-tools].each do |pkg|
  depends pkg
end

recipe            "default",          "This recipe bootstraps an EC2 instance for use in remastering the KidsRuby OS distribution"
recipe            "iso_prep",         "This recipe prepares the base image ISO for remastering"
recipe            "chroot_bootstrap", "This recipe prepares the chroot environment, bootstraps chef within the chroot and runs chef"
recipe            "iso_build",        "This recipe repacks and remasters the base image ISO, resulting in a new KidsRuby OS LiveCD image"

attribute 'kidsruby_os/remaster_root',
  :display_name => "Remaster Root",
  :description  => "The path where the base image ISO is unpacked for remastering",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby_os::chroot_bootstrap" ],
  :default      => "/root/tmp"

attribute 'kidsruby_os/chef_directory',
  :display_name => "Chef Directory",
  :description  => "The path to the Chef cookbooks",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby_os::chroot_bootstrap" ],
  :default      => "/etc/chef"

attribute 'kidsruby_os/iso_directory',
  :display_name => "ISO Directory",
  :description  => "The path where ISO files are managed",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby_os::iso_prep", "kidsruby_os::iso_build" ],
  :default      => "/iso"

attribute 'kidsruby_os/livecd_version',
  :display_name => "LiveCD Version",
  :description  => "The version of the KidsRuby ISO that is built",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby_os::iso_build" ],
  :default      => "0.0.0"

attribute 'kidsruby_os/remaster_iso',
  :display_name => "Remaster ISO",
  :description  => "The base image ISO that is remastered",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby_os::iso_prep" ],
  :default      => "ubuntu-mini-remix-11.04-i386.iso"

attribute 'kidsruby_os/remaster_iso_url',
  :display_name => "Remaster ISO URL",
  :description  => "The URL where the base image ISO is fetched from",
  :type         => "string",
  :required     => "required",
  :recipes      => [ "kidsruby_os::iso_prep" ],
  :default      => "http://www.ubuntu-mini-remix.org/download/11.04/ubuntu-mini-remix-11.04-i386.iso"