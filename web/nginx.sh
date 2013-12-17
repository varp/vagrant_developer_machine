#!/bin/bash

install_nginx()
{
  apt-get install -y -q nginx-common nginx-full
}

install_nginx