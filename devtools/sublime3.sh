#!/bin/bash

install_sublime3()
{
  sudo -i -E -u developer
	add-apt-repository -y ppa:webupd8team/sublime-text-3
	apt-get update
	apt-get install -y -q sublime-text-installer
  id developer && chown -R developer:developer /home/developer/.config/sublime-text-3
  exit 0
}

install_sublime3