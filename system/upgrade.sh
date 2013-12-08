#!/bin/bash

upgrade_system()
{
  echo -n "INFO: upgrading system..."
  apt-get update && apt-get upgrade -y && echo "\tDone."  
}

upgrade_system