#!/bin/bash

SCRIPTS_ROOT='/vagrant/vagrant_provision'

cd $SCRIPTS_ROOT


echo -n "1..."
echo -n "2..."
echo "3..."

./system/upgrade.sh
./devtools/vim.sh
./devtools/git.sh
./configs/configs.sh locales

# restore old CWD
cd $OLDPWD