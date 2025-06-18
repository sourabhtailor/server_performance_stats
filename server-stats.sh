#!/bin/bash
echo "+++++++++++++++++++++++++++++++++++++++++++++++++server performance stats+++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++++++++++++++++++++++++++++++++++Generated On $(date)++++++++++++++++++++++++++++++++++"
echo

#cpu usage
echo "-------------------------------------------------cpu usage-------------------------------------------------------------------"
CPU_USAGE=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $2 + $4}')
echo "Total cpu usages: $CPU_USAGE%"
echo

# Memory Usage
echo "-------------------------------------------------Memory Usage----------------------------------------------------------------"
TOTAL=$(free -m | grep "Mem" | awk '{print $2}')
echo "Total Memory: ${TOTAL}MB"
FREE=$(free -mh | grep "Mem" | awk '{print $3}')
echo "Free memory: ${FREE}"
USED=$(free -mh | grep "Mem" | awk '{print $4}')
echo "Used memory: ${USED}"
echo

#Disk Usage
echo "-------------------------------------------------Disk Usage-------------------------------------------------------------------"
TOTAL_DISK=$(df -h | grep '^/dev' | awk '{print $2}')
USED_DISK=$(df -h | grep '^/dev' | awk '{print $3}')
AVAILABLE_DISK=$(df -h | grep '^/dev' | awk '{print $4}')
PERCENTAGE_DISK=$(df -h | grep '^/dev' | awk '{print $5}')
echo "Total disk space: ${TOTAL_DISK}"
echo "Used Disk space: ${USED_DISK}"
echo "Available Disk space: ${AVAILABLE_DISK}"
echo "Disk Usage: ${PERCENTAGE_DISK}"
echo

#Top 5 processes by cpu usage
echo "-------------------------------------------Top 5 processes by CPU usage------------------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 5
echo

#Top 5 processes by Memory usage
echo "-------------------------------------------Top 5 Processes by Memory Usage----------------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 5
echo

#server uptime
echo "------------------------------------------From how long server is up---------------------------------------------------------"
uptime
echo

#load average
echo "-----------------------------load average from last 5 10 and 15 minutes respectively------------------------------------------"
top -b -n 1 | grep "load" | awk '{print $13, $14, 15}'
echo

#LoggedIn-Users
echo "-----------------------------------------currently logged-in users------------------------------------------------------------"
w
echo

#Failed login attempts
echo "----------------------------------Last 5 Failed login Attempts Details--------------------------------------------"
lastb | head -n 5
echo

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
