#!/bin/bash

install_packages()
{
  sudo -i -E -u developer
  for pack in $(cat ./devtools/languages/python/pip.packages.txt); do
    pip install $pack;
  done
  logout
}

install_packages