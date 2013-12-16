#!/bin/bash

install_rvm()
{
  \curl -sSL https://get.rvm.io | bash -s stable
  source $HOME/.rvm/scripts/rvm
}

install_ruby()
{
  rvm install ruby-2.0.0-p353
  rvm --default use 2.0.0
}


install_rvm
install_ruby