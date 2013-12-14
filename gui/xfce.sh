#!/bin/bash

apt-get install -y -q xubuntu-desktop
shopt -s dotglob
id developer && chown -R developer:developer /home/developer && chmod -R 775 /home/developer
shopt -u dotglob