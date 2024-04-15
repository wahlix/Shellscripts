#!/bin/bash

# Define source- and target directories for backup
echo "Enter the source directory: "
read SOURCE_DIR
echo "Enter the target directory: "
read TARGET_DIR
# Create a timestamp to uniquely identify the backup
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
# Using 'tar' to create a compressed archive of the source directory
tar -czf $(TARGET_DIR)/backup_$(TIMESTAMP).tar.gz -C $(SOURCE_DIR) .
# Confirm the backup has been created successfully
if [ $? -eq 0 ]; then
    echo "Backup created successfully!"
else
    echo "Backup creation failed!"
fi