#!/bin/bash

upgrade_system()
{
  echo -n "INFO: upgrading system..."
 apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y 
}

upgrade_system