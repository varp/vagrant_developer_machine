#!/bin/bash

install_rvm()
{
  \curl -sSL https://get.rvm.io --ruby=2.0.0-p353| bash -s stable
  source $HOME/.rvm/scritps/rvm.sh
}

install_ruby()
{
  rvm --default use 2.0.0-p353
  rvm use 2.0.0
}


install_rvm
install_ruby