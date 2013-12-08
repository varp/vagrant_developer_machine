#!/bin/bash

SCRIPTS_ROOT='/vagrant/vagrant_provision'

cd $SCRIPTS_ROOT

# ./system/upgrade.sh
# ./devtools/git.sh
./devtools/vim.sh
./configs/configs.sh locales

# restore old CWD
cd $OLDPWD