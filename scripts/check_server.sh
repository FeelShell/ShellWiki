#!/bin/bash

# network command ping
# network command nslookup
# network command nm-tool
# network command tracerroute
# network command dig
# network command telnet
# network command nc
# network command curl

# monitor command ps
# monitor command netstat
# monitor command pgrep

# mysql
# ab
# mongo
# php
# jstack
# nginxstatus
# nagios-libexec

resettem=$(tput sgr0)
nginx_server='http://10.156.11.173/nginx_status'

# function
Check_Nginx_Server()
{
    status_code=$(curl -m 5 -s -w %{http_code} ${nginx_server} -o /dev/null)
    
    if [ $status_code -eq 000 -o $status_code -ge 500 ] 
        then
            echo -e '\E[32m' "check http server error! response status code is " $resettem $status_code
        else
            http_content=$(curl -s ${nginx_server})
            echo -e '\E[32m' "check http server ok! \n" $resettem $http_content
    fi
    
}

Check_Nginx_Server

mysql_slave_server="127.0.0.1"

# grant replication slave, replication client on *.* to rep@'%' identified by 'pwd';
mysql_user='rep'
mysql_pwd='pwd'

Check_MySQL_Server()
{
    nc -z -w2 ${mysql_slave_server} 3306 &>/dev/null
    if [ $? -eq 0 ]
        then
            echo "Connect ${mysql_slave_server} OK!"
            mysql -u${mysql_user} -p${mysql_pwd} -h${mysql_slave_server} -e "show slave status\G" | grep "Slave_IO_Running" | awk 'if($2!="Yes"){print "Slave thread not running!";exit 1}'
            
            if [ $? -eq 0 ]
                 then
                 mysql -u${mysql_user} -p${mysql_pwd} -h${mysql_slave_server} -e "show slave status\G" | grep "Second_Behind_Master"
            fi
    else
        echo "Connect MySQL server not succeed!"
    fi
    
    
    
    
    
}
