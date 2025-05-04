#!/bin/bash

for WORD in Vini Vidi Vici
do
  echo -n "$WORD "
done
echo

for WORD in Vini Vidi Vici; do echo -n "$WORD "; done; echo

for NUMBER in {1..10}
do
  echo -n "$NUMBER "
done
echo

for FILE in $(ls ~)
do
  echo "$FILE"
done
