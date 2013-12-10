#!/bin/bash

install_bundler_gem()
{
  cd devtools/languages/ruby && gem install bundler && cd $OLDPWD
}

install_bundler_gem
bundle install