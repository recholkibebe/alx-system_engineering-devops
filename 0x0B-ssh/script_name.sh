#!/bin/bash

# Retrieve username, IP address, and state dynamically
username=$(whoami)  # Retrieves the current username
ip_address=$(hostname -I | awk '{print $1}')  # Retrieves the primary IP address
state="active"  # You can define the state however you want

# Output the information
echo "Name\tUsername\tIP\tState"
echo "531686-web-01\t$username\t$ip_address\t$state"
