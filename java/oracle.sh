#!/bin/bash

add_webupd_ppa()
{
  add-apt-repository -y ppa:webupd8team/java
  apt-get update
}

install_oracle_installer()
{
  # TODO accept Oracle Java license ## dpkg-config
  apt-get install -y oracle-java7-installer 
}

add_webupd_ppa
install_oracle_installer