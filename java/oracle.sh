#!/bin/bash

add_webupd_ppa()
{
  add-apt-repository -y ppa:webupd8team/java
  apt-get update
}

install_oracle_installer()
{
  # TODO accept Oracle Java license ## dpkg-config
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
  apt-get install -y -q oracle-java7-installer 
}

add_webupd_ppa
install_oracle_installer