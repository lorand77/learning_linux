#!/bin/bash

# Set variables
SOURCE_DIR="$1"
BACKUP_DIR="$2"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup_$DATE.tar.gz"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create the backup
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

# Confirm success
if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_DIR/$BACKUP_NAME"
else
  echo "Backup failed."
fi

