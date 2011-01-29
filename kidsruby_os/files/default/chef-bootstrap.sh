#!/bin/bash

echo '-------------------------'
echo '   Bootstrapping Chef    '
echo '-------------------------'

# run as root
if [ $(whoami) != "root" ]; then
  echo "You must be root to run the chef bootstrap setup"
  exit 2
fi

# is chef already bootstrapped?
command -v chef-solo >/dev/null && {
  echo "Chef is already bootstrapped"
  exit
}

# operate headless
export DEBIAN_FRONTEND=noninteractive

# ignore apparmor
echo "apparmor hold" | dpkg --set-selections

# update the system
apt-get update
apt-get dist-upgrade -y

# development and build tools
apt-get install -y build-essential

# we need curl to fetch rubygems
apt-get install -y curl

# ruby dependencies
apt-get install -y zlib1g-dev libssl-dev libreadline5-dev

# ruby
apt-get install -y ruby1.8 irb1.8 libopenssl-ruby1.8 libshadow-ruby1.8 ruby1.8-dev

# rubygems
curl -L 'http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz' | tar xvzf -
cd rubygems* && ruby1.8 setup.rb --no-ri --no-rdoc

# chef
gem1.8 update --system
gem1.8 install chef ohai --no-rdoc --no-ri

# symlink ruby and gem commands so chef can find them
ln -s /usr/bin/ruby1.8 /usr/bin/ruby
ln -s /usr/bin/gem1.8 /usr/bin/gem

echo '-------------------------'
echo 'Bootstrapping Chef - done'
echo '-------------------------'