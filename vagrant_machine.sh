#!/bin/bash

SCRIPTS_ROOT='/vagrant/vagrant_provision'

cd $SCRIPTS_ROOT


echo -n "1..."
echo -n "2..."
echo -n "3..."
echo "Building your developer machine ==>"


## deps goes first
./deps/openssl.sh
./deps/curl.sh
./deps/wget.sh
./deps/apt-add-repository.sh

## components goes after deps
./system/upgrade.sh
./devtools/vim.sh
./devtools/git.sh
./devtools/perl.sh
./devtools/python2.sh
./devtools/python3.sh
./configs/configs.sh locales

# restore old CWD
cd $OLDPWD