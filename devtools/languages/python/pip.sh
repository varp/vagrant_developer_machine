#!/bin/bash

echo "Warning! It will install latest version of [pip] and [setuptools]\nNot distributed with system!!!"

download_ez_setup()
{
     curl -3 -sSL https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -o /tmp/ez_setup.py
}

install_ez_setup()
{
     python /tmp/ez_setup.py
}

download_get_pip()
{
    curl -3 -sSL https://raw.github.com/pypa/pip/master/contrib/get-pip.py -o /tmp/get-pip.py
}

install_pip()
{
    python /tmp/get-pip.py
}

run()
{
    download_ez_setup
    install_ez_setup
    download_get_pip
    install_pip
}