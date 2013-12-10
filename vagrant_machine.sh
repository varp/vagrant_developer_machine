#!/bin/bash
SCRIPTS_ROOT="/home/vagrant/logout"
cd $SCRIPTS_ROOT
export DEBIAN_FRONTEND=noninteractive
export TERM=linux
echo "========================== Vagrant Dev Machine =========================="
echo "PWD =>\t $PWD"
echo "TERM =>\t $TERM"
echo "PATH =>\t $PATH"
echo "TTY =>\t  `tty`"
echo "STDIN =>\t `ls -la /dev/stdin`"
echo "PROC =>\t `ls -la /proc/self/fd/0`"
[ ! -f /dev/tty ] && echo "tty device found!"
echo "1...2...3..."
echo "======================= Building your developer machine ================="
./deps/apt-add-repository.sh
./deps/curl.sh
./deps/openssl.sh
./deps/wget.sh
./system/hostname.sh
./system/repo_yandex.sh
./system/ubuntu_fonts.sh
./system/upgrade.sh
./system/user.sh
./java/openjdk.sh
./gui/xfce.sh
./devtools/git.sh
./devtools/sublime3.sh
./devtools/vim.sh
./devtools/languages/nodejs.sh
./devtools/languages/perl.sh
./devtools/languages/python2.sh
./devtools/languages/python3.sh
./devtools/languages/ruby.sh
./devtools/languages/python/packages.sh
./devtools/languages/python/pip.sh
./devtools/languages/python/venv.sh
./devtools/languages/ruby/packages.sh
./devtools/languages/ruby/rvm.sh
./configs/configs.sh apache apt locales nginx postgresql sysctl
# restore old CWD
cd $OLDPWD
## reboot
# reboot
exit 0
