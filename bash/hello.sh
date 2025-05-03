#!/bin/bash

NAME=Lorand
echo "Hello $NAME!"

for WORD in Vini Vidi Vici
do
  echo -n "$WORD "
done
echo

for WORD in Vini Vidi Vici; do echo -n "$WORD "; done; echo
