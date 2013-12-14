#!/bin/bash

install_bundler_gem()
{
  rvm use 2.0.0
  gem install bundler
}

install_bundler_gem
cd devtools/languages/ruby && bundle install && cd $OLDPWD