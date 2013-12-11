#!/bin/bash

install_sublime3()
{
	add-apt-repository -y -q ppa:webupd8team/sublime-text-3
	apt-get update
	apt-get install -y -q sublime-text-installer
}

install_sublime3