#!/bin/bash

MAX_USAGE=90

DISK_USAGE=$(df | grep "/$" |sed -E "s/ +/ /g" | cut -f5 -d" " | sed "s/%//g")

if [[ "$DISK_USAGE" -gt "$MAX_USAGE" ]]
then
  echo "disk is almost full, time to delete things"
fi
