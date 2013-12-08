#!/bin/bash

install_packages()
{
  for pack in $(cat ./devtools/language/perl/cpan.packages.txt); do
    cpan $pack;
  done	
}

install_packages