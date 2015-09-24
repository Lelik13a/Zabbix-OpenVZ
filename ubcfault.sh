#!/bin/bash

CTID=$(echo $1 | awk '{match($0,"[0-9]+$",ID); print ID[0]}')

if [[ -e /proc/bc/${CTID}/resources ]]; then
	/usr/bin/sudo /bin/cat /proc/bc/${CTID}/resources | awk 'BEGIN{count=0}{count+=$$6}END{print count}'
else echo 0
fi
