#!/bin/bash

upgrade_system()
{
  echo -n "INFO: upgrading system..."
 apt-get update && apt-get dist-upgrade -y 
}

upgrade_system