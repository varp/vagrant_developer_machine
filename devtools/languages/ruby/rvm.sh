#!/bin/bash

id developer && cd /home/developer/ && curl -sSL https://get.rvm.io | bash -s stable && cd $OLDPWD
rvm --default  use 2.0.0