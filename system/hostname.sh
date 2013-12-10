#!/bin/bash

update_hostname()
{
	machine_num=$(head -c 1 /dev/random | od -t u1 | awk '{for (i = 2; i <= NF; i++) print $i}')
	machine_name="developer-pc-$machine_num"

	echo $machine_name > /etc/hostname
}

update_hostname