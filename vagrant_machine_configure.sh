#!/bin/bash

set_developer_user_passwd()
{
  echo "Set password for user: developer"
  passwd developer
}

configure_packages()
{
  echo "Configuring packages:"
  dpkg --configure -a
}

echo "===================== Vagrant Machine Post-Configuration ================="
set_developer_user_passwd
configure_packages