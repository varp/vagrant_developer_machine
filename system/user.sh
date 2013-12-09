#!/bin/bash

add_developer_user()
{
	useradd -m -s /bin/bash -G adm,sudo,dip,plugdev,lpadmin,sambashare,admin,vboxsf developer
	echo "INFO: Enter password for your developer user"
}

add_developer_user