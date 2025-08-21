#!/bin/bash

if [[ -z "$1" ]]
then
  echo "Ah ah ah! You did not provide the commit message!"
  exit 1
fi

git status

echo -n "Proceed? [y/n] "
read ANSWER
if [[ "$ANSWER" == "y" ]]
then
  git add .
  git commit -m "$1"
  git push
fi
