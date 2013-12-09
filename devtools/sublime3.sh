#!/bin/bash

install_sublime3()
{
	add-apt-repository -y ppa:webupd8team/sublime-text-3
	apt-get update
	apt-get install -y sublime-text-installer
}

install_sublime3