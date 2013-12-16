#!/bin/bash

developer_user()
{
  sudo -i -u developer
}

install_cpan_config()
{
  cpan -f ./devtools/languages/perl/cpan.config.pm
  # cp -vf ./devtools/languages/perl/cpan.config.pm $HOME/.cpan/CPAN/MyConfig.pm
}

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

log_out()
{
  logout
}


# developer_user
install_deps_lib
install_packages
install_cpan_config
# log_out