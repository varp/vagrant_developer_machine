#!/bin/bash

SCRIPTS_ROOT="/home/vagrant/logout"
cd $SCRIPTS_ROOT
export DEBIAN_FRONTEND=readline
export TERM=linux

echo "========================== Vagrant Dev Machine =========================="
echo "PWD => $PWD"
echo "TERM => $TERM"
echo "PATH => $PATH"
echo "TTY =>  `tty`"
echo "STDIN => `ls -la /dev/stdin`"
echo "PROC => `ls -la /proc/self/fd/0`"
[ ! -f /dev/tty ] && echo "tty device found!"



echo "1...2...3..."
echo "======================= Building your developer machine ================="

./system/hostname.sh
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

./java/openjdk.sh

./db/mysql/mysql.sh
./db/postgresql/postgresql.sh
./db/redis/redis.sh

./devtools/pgadmin.sh
./devtools/vim.sh
./devtools/sublime3.sh
./devtools/git.sh
./devtools/languages/perl.sh

./devtools/languages/python2.sh
./devtools/languages/python/pip.sh
./devtools/languages/python/venv.sh
./devtools/languages/python/packages.sh

./devtools/languages/python3.sh

./devtools/languages/ruby.sh
./devtools/languages/ruby/rvm.sh
./devtools/languages/ruby/packages.sh

./configs/configs.sh locales

# restore old CWD
cd $OLDPWD

## reboot
# reboot

exit 0
