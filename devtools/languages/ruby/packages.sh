#!/bin/bash

install_bundler_gem()
{
  sudo -i developer
  rvm use 2.0.0
  gem install bundler
}

install_gems()
{
  rvm use 2.0.0
  cd devtools/languages/ruby && bundle install && cd $OLDPWD
  logout
}


install_bundler_gem
install_gems