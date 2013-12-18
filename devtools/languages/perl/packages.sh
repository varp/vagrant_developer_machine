#!/bin/bash
install_cpanminus()
{
  apt-get install -y -q cpanminus libdancer-perl
}

install_deps_lib()
{
  apt-get install -y libyaml-0-2 libgd2-xpm-dev build-essential postgresql-server-dev-all
}

install_packages()
{
  for pack in $(cat ./devtools/languages/perl/cpan.packages.txt); do
    cpanm --installdeps --no-interactive --sudo --local-lib /usr/share/perl5 $pack;
  done	
}


install_deps_lib
install_cpanminus
install_packages