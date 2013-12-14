#!/bin/bash

install_sublime3()
{
	add-apt-repository -y -q ppa:webupd8team/sublime-text-3
	apt-get update
	apt-get install -y -q sublime-text-installer
  id developer && chown -R developer:developer /home/developer/.config/sublime-text-3
}

install_sublime3