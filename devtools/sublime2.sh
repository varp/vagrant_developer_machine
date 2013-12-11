#!/bin/bash

install_sublime2()
{
	add-apt-repository -y -q ppa:webupd8team/sublime-text-2
	apt-get update
	apt-get install -y -q sublime-text
}

install_sublime2