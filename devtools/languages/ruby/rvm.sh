#!/bin/bash

install_rvm()
{
  \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0-p353
  source /usr/local/rvm/scripts/rvm
}

install_ruby()
{
  rvm --default use 2.0.0-p353
  rvm use 2.0.0
}


install_rvm
install_ruby