#!/bin/bash
SCRIPTS_ROOT="/vagrant"
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
./system/samba.sh
./deps/apt_add_repository.sh
./deps/packages.sh
./gui/unity.sh
./gui/ubuntu_fonts.sh
./devtools/languages/python/pip.sh
./devtools/languages/python/venv.sh
./devtools/languages/ruby/rvm.sh
./devtools/vim.sh
./devtools/git.sh
./devtools/sublime3.sh
./devtools/pgadmin.sh
./devtools/languages/php.sh
./devtools/languages/ruby.sh
./devtools/languages/python3.sh
./devtools/languages/python/packages.sh
./devtools/languages/ruby/packages.sh
./web/nginx.sh
./db/postgresql/postgresql.sh
./configs/configs.sh locales
# restore old CWD
cd $OLDPWD
exit 0
