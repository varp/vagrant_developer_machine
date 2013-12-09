#!/bin/bash

SCRIPTS_ROOT='/vagrant/vagrant_provision'
export DEBIAN_FRONTEND=readline

cd $SCRIPTS_ROOT


echo "1...2...3..."
echo "Building your developer machine ==>"

./system/hostname.sh
./system/user.sh
./system/repo_yandex.sh
## upgrade goes first of all
./system/upgrade.sh

## deps goes first
./deps/openssl.sh
./deps/curl.sh
./deps/wget.sh
./deps/apt-add-repository.sh

## adding developer user
./system/user.sh

# ## components goes after deps

./gui/xfce.sh
./system/ubuntu_fonts.sh

./java/oracle.sh

./db/mysql/mysql.sh
./db/postgresql/postgresql.sh
./db/redis/redis.sh

./devtools/pgadmin.sh
./devtools/vim.sh
./devtools/sublime3.sh
./devtools/git.sh
./devtools/languages/perl.sh
./devtools/languages/python2.sh
./devtools/languages/python3.sh


./configs/configs.sh locales

# restore old CWD
cd $OLDPWD