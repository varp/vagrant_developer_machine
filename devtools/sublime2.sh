#!/bin/bash

install_sublime2()
{
  sudo -i -E -u developer
	add-apt-repository -y ppa:webupd8team/sublime-text-2
	apt-get update
	apt-get install -y -q sublime-text
  id developer && chown -R developer:developer /home/developer/.config/sublime-text-2
  logout
  exit 0
}

install_sublime2