#!/bin/bash
echo "==== HEALTH REPORT ===="

echo

echo "System uptime:"
uptime

echo

echo "Memory Usage:"
free -h 

echo

echo "Disk usage"
df -h  /

echo


echo "processes:" 
ps aux --sort=-%mem | head -6

echo

echo "failed services:"
systemctl --failed

