#!/bin/bash

install_deps_lib()
{
  apt-get install -y libyaml-0-2 libgd2-xpm-dev build-essential
}

install_packages()
{
  for pack in $(cat ./devtools/language/perl/cpan.packages.txt); do
    cpan $pack;
  done	
}

install_deps_lib
install_packages