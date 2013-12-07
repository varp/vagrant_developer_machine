#!/bin/bash

install_packages()
{
  for pack in $(cat pip.packages.txt); do
    pip install $pack;
  done
}

install_packages