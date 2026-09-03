#!/bin/bash

# Store information in variables
current_date=$(date)
hostname=$(hostname)
username=$(whoami)
disk_usage=$(df -h)

# Take user input
read -p "Enter directory name: " directory

# Create directory
mkdir -p "$directory"

# Create file
touch "$directory/processes.txt"

# Store running processes in the file
ps > "$directory/processes.txt"

# Display system information
echo "Current Date: $current_date"
echo "Hostname: $hostname"
echo "Username: $username"

echo "Disk Usage:"
echo "$disk_usage"

echo "Running Processes:"
ps

echo "Process information has been stored in $directory/processes.txt"
