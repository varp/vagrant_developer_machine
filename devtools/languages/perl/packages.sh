#!/bin/bash

install_cpan_config()
{
  cpan -j ./devtools/languages/perl/cpan.config.pm
  # cp -vf ./devtools/languages/perl/cpan.config.pm $HOME/.cpan/CPAN/MyConfig.pm
}

install_deps_lib()
{
  apt-get install -y libyaml-0-2 libgd2-xpm-dev build-essential
}

install_packages()
{
  for pack in $(cat ./devtools/languages/perl/cpan.packages.txt); do
    cpan -j ./devtools/languages/perl/cpan.config.pm $pack;
  done	
}


install_deps_lib
install_cpan_config
install_packages