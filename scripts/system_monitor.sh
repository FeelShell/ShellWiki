#!/bin/bash

clear

if [[ $# -eq 0 ]]
    then
        # Define Variable reset_terminal
        reset_terminal=$(tput sgr0)
        
        # Check OS Type
        os=$(uname -o)
        echo -e '\E[32m' "Check OS Type" $reset_terminal $os
        # Check OS Release Version and Name
        os_name=$(cat /etc/issue | grep -e "Server")
        echo -e '\E[32m' "Check OS Release Version and Name" $reset_terminal $os_name
        # Check Architecture
        architecture=$(uname -m)
        echo -e '\E[32m' "Check Architecture" $reset_terminal $architecture
        # Check Kernel Release
        kenelrelease=$(uname -r)
        echo -e '\E[32m' "Check Kernel Release" $reset_terminal $kernelrelease
        # Check hostname
        hostname=$(uname -n)
        echo -e '\E[32m' "Check Hostname" $reset_terminal $hostname
        # Check Internal IP
        internalip=$(hostname -I)
        echo -e '\E[32m' "Check Internal IP" $reset_terminal $internalip
        # Check External IP
        externalip=$(curl -s http://ipecho.net/plain)
        echo -e '\E[32m' "Check External IP" $reset_terminal $externalip
        # Check DNS
        nameservers=$(cat /etc/resolv.con | grep -E "\<nameserver[ ]+" | awk '{print $NF}')
        echo -e '\E[32m' "Check DNS" $reset_terminal $nameservers
        # Check if connected to Internet or not
        ping -c 2 baidu.com &>/dev/null && echo "Internet:Connected" || echo "Internet:Disconnect"
        # Check Logged In Users
        who>/tmp/who
        echo -e '\E[32m' "Logged In Users" $reset_terminal && cat /tmp/who
        rm -rf /tmp/who
        
        system_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
        apps_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
        
        echo -e '\E[32m' "system mem usages " $reset_terminal $system_mem_usages
        echo -e '\E[32m' "apps mem usages " $reset_terminal $app_mem_usages
        
        load_average=$(top -n 1 -b | grep "load average:" | awk '{print $12 $13 $14}')
        echo -e '\E[32m' "Load Averages " $reset_terminal $load_average
        
        disk_average=$(df -hP | grep -vE 'Filesystem' | awk '{print $1 " " $5}')
        echo -e '\E[32m' "Disk Averages " $reset_terminal $disk_average
        
fi


