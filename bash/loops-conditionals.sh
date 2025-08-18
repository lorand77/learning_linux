#!/bin/bash

time (
for NUMBER in {1..9999}
do
  echo -n "$NUMBER, " >> results.txt
done
echo 10000 >> results.txt
)

time (
for NUMBER in {1..10000}
do
  if [[ "$NUMBER" -lt 10000 ]]
  then
    echo -n "$NUMBER, " >> results.txt
  else
    echo "$NUMBER" >> results.txt
  fi
done
)
