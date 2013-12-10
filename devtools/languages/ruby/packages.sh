#!/bin/bash

install_bundler_gem()
{
  gem install bundler
}

install_bundler_gem
cd devtools/languages/ruby && bundle install && cd $OLDPWD