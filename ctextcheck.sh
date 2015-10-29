#!/bin/bash

CTID=$1

/usr/bin/sudo /usr/sbin/vzctl exec2 $CTID /etc/zabbix/ct_check.sh $2


