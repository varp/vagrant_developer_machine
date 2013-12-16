#!/bin/bash

apt-get install -y -q curl openssl wget gzip bzip2 p7zip-full zlib1g zlib1g-dev tar unrar dialog
ln -sv /bin/tar /usr/bin/tar
ln -sv /bin/gzip /usr/bin/gzip