#!/bin/bash

install_zippers()
{
  apt-get install -y -q gzip bzip2 p7zip zlib1g zlib1g-dev
}

install_zippers