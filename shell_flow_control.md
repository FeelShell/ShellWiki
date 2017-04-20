# 流程控制语句

## 条件判断

### 文件类型判断

- -b 文件     判断文件是否存在，并且 是否为块设备文件
- -c 文件     判断文件是否存在，并且 是否为字符设备文件
- -d 文件     判断文件是否存在，并且 是否为目录文件
- -e 文件     判断文件是否存在
- -f 文件     判断文件是否存在，并且 是否为普通文件
- -L 文件     判断文件是否存在，并且 是否为符号链接文件
- -p 文件     判断文件是否存在，并且 是否为管道文件
- -s 文件     判断文件是否存在，并且 是否为非空
- -S 文件     判断文件是否存在，并且 是否为套接字文件

```shell
test -e /root/install.log
[ -e /root/install.log ]

[ -d /root ] && echo yes || echo no
```

### 文件权限判断

- -r     判断文件是否存在， 并且 是否该文件 具有 read 权限
- -w     判断文件是否存在， 并且 是否该文件 具有 write 权限
- -x     判断文件是否存在， 并且 是否该文件 具有 execute 权限
- -u     判断文件是否存在， 并且 是否该文件 具有 SUID 权限
- -g     判断文件是否存在， 并且 是否该文件 具有 SGID 权限
- -k     判断文件是否存在， 并且 是否该文件 具有 sBit 权限

### 比较两个文件

file1 -nt file2      newer than
file1 -ot file2      older than
file1 -ef file2      lnode号是否一致，用于判断硬链接是很好的办法

### 比较两个整数

integer1 -eq integer2
integer1 -ne integer2
integer1 -gt integer2
integer1 -lt integer2
integer1 -ge integer2
integer1 -le integer2

```shell
[ 23 -eq 32 ] && echo yes || echo no
```

### 字符串的判断

- -z string              判断字符串是否为空
- -n string              判断字符串是否非空
- string1 == string2
- string1 != string2

### 多重条件判断

- -a  and
- -o  or
- !   not

## 单分支 if

if [ 条件判断式 ];then

fi

if [ 条件判断式 ]
    then

fi

```shell
#!/bin/bash

# 判断登录用户
test=$(env | grep USER | cut -d "=" -t 2 == root)

if [ "$test" == "root" ]
    then
    echo "yes"
fi

# 判断分区使用率
rate=$(df -h | grep sda5 | awk '{print $5}' | cut -d "%" -f 1)

if [ "$rate" -ge "90" ]
    then
    echo "System alert"
fi
```

## 双分支 if

if [ 条件判断式 ]
    then
        statement0
    else
        statement1
fi

```shell
#!/bin/bash

read -t 30 -p "please input dir name:" dir

if [ -d "$dir" ]
    then
        echo "yes"
    else
        echo "no"
fi
```

```shell
#!/bin/bash

# httpd start or not
# be care of the file name

test=$(ps aux | grep httpd | grep -v grep)

if [ -n "$test" ]
    then
        echo "$(date) httpd is ok!" >> /tmp/autostart-acc.log
    else
        /etc/rc.d/init.d/httpd start &>/dev/null
        echo "$(date) restart httpd!" >> /tmp/autostart-err.log
fi
```


## 多分支 if

if [ 条件判断式 ]
    then
        statement0
elif [ 条件判断式 ]
    then
        statement1
...
else
    statement2
fi

```shell
#!/bin/bash

# file exist

read -t 30 -p "please input a filename: " file

if [ -z "$file" ]
    then
        echo "please input a filename"
        exit 11
elif [ ! -e "$file"]
    then
        echo "$file not exist"
        exit 12
elif [ -f "$file" ]
    then
        echo "$file exist"
elif [ -d "$file" ]
    then
        echo "$file is directory"
else
    then
        echo "$file type cann't recognize"
fi
```

## 多分支 case

case $var in
    "val0")
        statement
        ;;
    "val1")
        statement
        ;;
    ...
    *)
        statement
        ;;
esac    

## for

for var in val1 val2 val3 ...
    do
        statement
    done

```shell
#!/bin/bash

cd /root/test/
ls *.tar.gz > ls.log
ls *.tgz >> ls.log

for i in $( cat ls.log )
    do
        tar -zxf $i &>/dev/null
    done

rm -rf ls.log
```

for (( i=1;i<=100;i=i+1))
    do
        statement
    done

## while & until

for   固定循环
while 条件循环

while [条件判断式]
    do
        statement
    done

until 与 while 相反

until [条件判断式]
    do
        statement
    done
