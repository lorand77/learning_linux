#!/bin/bash

rm results.txt

MAX_N=10000

time (
for NUMBER in $(seq $(($MAX_N - 1)))
do
  echo -n "$NUMBER, " >> results.txt
done
echo "$MAX_N" >> results.txt
)

time (
for NUMBER in $(seq $MAX_N)
do
  if [[ "$NUMBER" -lt "$MAX_N" ]]
  then
    echo -n "$NUMBER, " >> results.txt
  else
    echo "$NUMBER" >> results.txt
  fi
done
)
