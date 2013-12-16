#!/bin/bash

install_zippers()
{
  apt-get install -y -q gzip bzip2 p7zip-full zlib1g zlib1g-dev tar unrar
  ln -sv /bin/tar /usr/bin/tar
}

install_zippers