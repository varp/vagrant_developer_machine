#!/bin/bash

install_rvm()
{
  \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.2
  source /usr/local/rvm/scripts/rvm
}

install_ruby()
{
  rvm --default use 2.1.2
  rvm use 2.1.2
}


install_rvm
install_ruby