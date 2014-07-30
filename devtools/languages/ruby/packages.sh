#!/bin/bash

install_bundler_gem()
{
  sudo -i -E -u developer
  source /usr/local/rvm/scripts/rvm
  rvm use 2.1.2
  gem install bundler
  logout
}

install_gems()
{
  sudo -i -E -u developer
  source /usr/local/rvm/scripts/rvm
  rvm use 2.1.2
  cd devtools/languages/ruby && bundle install && cd $OLDPWD
  logout
}


install_bundler_gem
install_gems