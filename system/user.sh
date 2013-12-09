#!/bin/bash

add_developer_user()
{
	useradd -a -m -s /bin/bash -G adm,sudo,dip,plugdev,lpadmin,sambashare,admin,vboxsf developer
	echo "INFO: Enter password for your developer user"
	passwd developer
}

add_developer_user