#!/bin/bash

install_bundler_gem()
{
  source /usr/local/rvm/scripts/rvm
  rvm use 2.0.0
  gem install bundler
}

install_gems()
{
  source /usr/local/rvm/scripts/rvm
  rvm use 2.0.0
  cd devtools/languages/ruby && bundle install && cd $OLDPWD
}


install_bundler_gem
install_gems