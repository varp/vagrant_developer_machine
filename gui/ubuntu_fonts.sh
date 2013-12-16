#!/bin/bash

install_ubuntu_fonts()
{
	add-apt-repository -y -q ppa:webupd8team/ubuntu-font-family
	apt-get update
	apt-get install -y -q ubuntu-font-family-sources
}

install_ubuntu_fonts