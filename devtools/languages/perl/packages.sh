#!/bin/bash


install_cpanminus()
{
  apt-get install -y -q cpanminus
}

install_deps_lib()
{
  apt-get install -y libyaml-0-2 libgd2-xpm-dev build-essential postgresql-server-dev-all
}

install_packages()
{
  for pack in $(cat ./devtools/languages/perl/cpan.packages.txt); do
    cpanm --installdeps --no-interactive $pack;
  done	
}


install_deps_lib
install_cpan_config
install_packages