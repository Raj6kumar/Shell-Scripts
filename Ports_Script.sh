#!/bin/bash
# List all listening ports and the associated services
netstat -tuln | grep LISTEN



#To use this script install net-tools:
# sudo apt install net-tools
