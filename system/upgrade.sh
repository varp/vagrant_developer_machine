#!/bin/bash

upgrade_system()
{
  echo -n "INFO: upgrading system..."
 apt-get update && apt-get dist-upgrade -y 
}

upgrade_vbox_guest_additions()
{
  apt-get install -y virtualbox-guest-additions virtualbox-guest-utils
}

upgrade_system
upgrade_vbox_guest_additions