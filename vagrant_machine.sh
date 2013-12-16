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
./system/hostname.sh
./deps/apt_add_repository.sh
./deps/packages.sh
./java/oracle.sh
# restore old CWD
cd $OLDPWD
exit 0 && exit 0
