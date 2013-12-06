#!/bin/bash

test_file=test_vagrant_provision

[ -f $HOME/$test_file ] && echo 'test OK!'

[ ! -f $HOME/$test_file ] && touch  $test_file
