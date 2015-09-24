#!/bin/bash

CTID=$(echo $1 | awk '{match($0,"[0-9]+$",ID); print ID[0]}')

/usr/bin/sudo /usr/sbin/vzlist -a -o $2 -H $CTID

