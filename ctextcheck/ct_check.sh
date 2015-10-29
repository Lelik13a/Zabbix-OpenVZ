#!/bin/bash

# This script performs simple check, like nagios

case $1 in 

"ct.extcheck.sshd")
	/etc/init.d/sshd status 2>&1 > /dev/null	
	if [[ $? -ne 0 ]]; then
		echo "ERROR; ssh server not running"
		exit 1;
	else	
                echo "OK"
                exit 0;
	fi
;;

*)
	echo "ct.extcheck.sshd;Check sshd status"
;;
esac
