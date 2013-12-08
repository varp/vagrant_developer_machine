#!/bin/bash

test_file=test_vagrant_provision

[ -f $HOME/$test_file ] && echo 'test OK!'

[ ! -f $HOME/$test_file ] && touch $test_file

if [ -z $VAGRANT_DEVELOPER_MACHINE_PATH ]; then
  echo "ERR: Run 'make install'."
  exit -1
else
  cd $VAGRANT_DEVELOPER_MACHINE_PATH
fi

./system/upgrade.sh
./devtools/vim.sh
./devtools/git.sh
./configs.sh locales


## restore OLD_PWD
cd $OLDPWD && exit 0