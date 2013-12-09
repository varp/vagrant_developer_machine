#!/bin/bash

SCRIPTS_ROOT='/vagrant/vagrant_provision'

cd $SCRIPTS_ROOT


echo "1..."
echo "2..."
echo "3..."
echo "Building your developer machine ==>"

## upgrade goes first of all
./system/upgrade.sh

## deps goes first
./deps/openssl.sh
./deps/curl.sh
./deps/wget.sh
./deps/apt-add-repository.sh

# ## components goes after deps
./devtools/vim.sh
./devtools/git.sh
./devtools/languages/perl.sh
./devtools/languages/python2.sh
./devtools/languages/python3.sh
./configs/configs.sh locales

# restore old CWD
cd $OLDPWD