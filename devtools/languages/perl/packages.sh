#!/bin/bash

install_packages()
{
  for pack in $(cat cpan.packages.txt); do
    cpan $pack;
  done	
}

install_packages