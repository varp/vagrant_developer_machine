#!/bin/sh

test_file=test_vagran_provision

[ -f $HOME/test_file ] && echo 'test OK!'

[ ! -f $HOME/test_file ] && touch test_vagrant_provision
