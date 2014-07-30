#!/bin/bash

install_rvm()
{
  sudo -i -u developer
  \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.2
  source $HOME/.rvm/scripts/rvm
}

install_ruby()
{
  sudo -i -u developer
  rvm --default use 2.1.2
  rvm use 2.1.2
  exit 0
}


install_rvm
install_ruby