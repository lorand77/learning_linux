#!/bin/bash

MAX_USAGE=10

DISK_USAGE=$(df | grep "/$" |sed -E "s/ +/ /g" | cut -f5 -d" " | sed "s/%//g")

if [[ "$DISK_USAGE" -gt "$MAX_USAGE" ]]
then
  echo "disk is almost full, time to delete things" | mail -s "disk alert" z
fi
