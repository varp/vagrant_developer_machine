#!/bin/bash

install_mate_desktop()
{
  add-apt-repository "deb http://packages.mate-desktop.org/repo/ubuntu $( lsb_release -cs) main"
  apt-get update
  apt-get install mate-archive-keyring
  apt-get update
  # this installs base packages
  apt-get install mate-core
  # this installs more packages
  apt-get install mate-desktop-environment
}

install_mate_desktop