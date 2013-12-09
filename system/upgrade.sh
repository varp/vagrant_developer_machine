#!/bin/bash

upgrade_system()
{
  echo -n "INFO: upgrading system..."
  DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y 
}

upgrade_system