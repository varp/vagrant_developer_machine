#!/bin/bash

add_developer_user()
{
	useradd -m -s /bin/bash -G adm,sudo,dip,plugdev,lpadmin,sambashare,admin,vboxsf developer
  shopt -s dotglob
  id developer && chown -R developer:developer /home/developer && chmod -R 775 /home/developer
  shopt -u dotglob  
}

add_developer_user