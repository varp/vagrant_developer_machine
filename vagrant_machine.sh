#!/bin/bash
SCRIPTS_ROOT="/home/vagrant/logout"
cd $SCRIPTS_ROOT
export DEBIAN_FRONTEND=noninteractive
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
./system/user.sh
./system/ubuntu_fonts.sh
./system/hostname.sh
./deps/curl.sh
./deps/openssl.sh
./deps/wget.sh
./deps/zippers.sh
./deps/apt_add_repository.sh
./devtools/languages/ruby/rvm.sh
./devtools/languages/perl.sh
./devtools/languages/perl/packages.sh
./devtools/languages/ruby.sh
./devtools/languages/ruby/packages.sh
# restore old CWD
cd $OLDPWD
exit 0
