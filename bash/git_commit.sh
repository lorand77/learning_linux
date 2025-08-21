#!/bin/bash

git status

echo -n "Proceed? y/n "
read ANSWER
if [[ "$ANSWER" == "y" ]]
then
  git add .
  git commit -m "$1"
  git push
fi
