#!/bin/bash

add_developer_user()
{
	useradd -m -s /bin/bash -G adm,sudo,dip,plugdev,lpadmin,sambashare,admin,vboxsf developer
}

add_developer_user