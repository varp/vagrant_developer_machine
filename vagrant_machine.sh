#!/bin/bash
SCRIPTS_ROOT="/home/vagrant/logout"
cd $SCRIPTS_ROOT
export DEBIAN_FRONTEND=noninteractive
export TERM=linux
echo "========================== Vagrant Dev Machine =========================="
echo "PWD   => $PWD"
echo "TERM  => $TERM"
echo "PATH  => $PATH"
echo "TTY   => `tty`"
echo "STDIN => `ls -la /dev/stdin`"
echo "PROC  => `ls -la /proc/self/fd/0`"
[ ! -f /dev/tty ] && echo "tty device found!"
echo "1...2...3..."
echo "======================= Building your developer machine ================="
./system/repo_yandex.sh
./system/upgrade.sh
./system/hostname.sh
./system/ubuntu_fonts.sh
./system/user.sh
./deps/curl.sh
./deps/wget.sh
./deps/openssl.sh
./deps/apt-add-repository.sh
./gui/xfce.sh
./devtools/git.sh
./devtools/sublime3.sh
./devtools/vim.sh
./devtools/languages/perl.sh
./devtools/languages/ruby.sh
./devtools/languages/python3.sh
./devtools/languages/nodejs.sh
./devtools/languages/python2.sh
./devtools/languages/python/packages.sh
./devtools/languages/python/venv.sh
./devtools/languages/python/pip.sh
./devtools/languages/ruby/packages.sh
./devtools/languages/ruby/rvm.sh
./configs/configs.sh locales apt sysctl nginx postgresql apache
# restore old CWD
cd $OLDPWD
## reboot
# reboot
exit 0
