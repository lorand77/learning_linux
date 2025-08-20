#!/bin/bash

# Configuration
REPO_NAME="activity-filler"
COMMIT_COUNT_PER_DAY=1
START_DATE="2025-06-01"
END_DATE="2025-08-01"
GIT_EMAIL="you@example.com"
GIT_NAME="Your Name"

# Create repo if it doesn't exist
if [ ! -d "$REPO_NAME" ]; then
  git init "$REPO_NAME"
  cd "$REPO_NAME" || exit
  git config user.email "$GIT_EMAIL"
  git config user.name "$GIT_NAME"
else
  cd "$REPO_NAME" || exit
fi

# Create a file to modify
echo "Starting activity filler..." > activity.log

# Convert dates
start=$(date -I -d "$START_DATE")
end=$(date -I -d "$END_DATE")

# Loop through the dates
current=$start
while [ "$current" != "$end" ]; do
  for ((i = 1; i <= COMMIT_COUNT_PER_DAY; i++)); do
    echo "$current - Commit #$i" >> activity.log
    GIT_AUTHOR_DATE="$current 12:00:00" GIT_COMMITTER_DATE="$current 12:00:00" git add activity.log
    GIT_AUTHOR_DATE="$current 12:00:00" GIT_COMMITTER_DATE="$current 12:00:00" git commit -m "Fake commit on $current #$i"
  done
  current=$(date -I -d "$current + 1 day")
done
