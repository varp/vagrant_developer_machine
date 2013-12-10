#!/bin/bash

SCRIPTS_ROOT="/home/vagrant/logout"
cd $SCRIPTS_ROOT
export DEBIAN_FRONTEND=noninteractive
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


  [["devtools/languages/nodejs.sh", "devtools/languages/perl.sh", "devtools/languages/python2.sh", "devtools/languages/python3.sh", "devtools/languages/ruby.sh"], "gui/xfce.sh"]


# restore old CWD
cd $OLDPWD

## reboot
# reboot

exit 0
