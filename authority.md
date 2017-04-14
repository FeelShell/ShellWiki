# 权限管理

## alter

chmod [option] mode file\_name

- -R recursion
- [ugoa][+-=][rwx]
- [mode=421]

chmod u+x file\_name
chmod g+w,o+w file\_name
chmod u-x,g-x,o-x file\_name
chmod a=rwx file\_name

chmod 755 file\_name
chmod 644 file\_name

## 作用

- r  读取文件内容 cat more head tai
- w  编辑、新增、修改文件内容 vi echo 不可删除文件, 对目录有写权限才可以删除其中的文件
- x  可执行

- r  可以查询目录下文件名   ls
- w  具有修改目录结构的权限
> - 新建文件和目录
> - 删除此目录下文件和目录
> - 重命名此目录下文件和目录
> - 剪切 touch rm mv cp
- x  可以进入目录 cd 

文件
最高权限 x

目录
最高权限 w
0 5 7 才有意义，其余不成立
1 4 6 没有意义

chown user\_name file\_name
chgrp group\_name file\_name

chown user\_name:group\_name file\_name


## default authority

umask # 查看默认权限
0022

- 0 文件特殊权限
- 022 文件默认权限

### 文件的默认权限

- 文件默认不能建立为执行文件，必须手工赋予执行权限
- 所有文件默认权限最大为666
- 默认权限需要换算成字母再相减
- 建立文件之后的默认权限，为666减去umask

666 -rw-rw-rw-
022 -----w--w-
644 -rw-r--r--

666 -rw-rw-rw-
033 -----wx-wx
644 -rw-r--r--

### 目录的默认权限

- 目录默认权限最大 777
- 默认权限需要换算成字母再相减
- 建立文件之后的默认权限， 777 - umask

777 -rwxrwxrwx
022 -----w--w-
755 -rwxr-xr-x


umask 0022 # 临时修改
vim /etc/profile # 永久修改

## ACL 权限

用于解决用户身份不足的问题 

### 查看 ACL 权限是否开启

dumpe2fs -h /dev/sda5   # 查询指定分区详细文件系统信息的命令
> -h 仅显示超级块中信息，而不显示磁盘块组的详细信息

### 临时开启分区ACL权限

mount -o remount,acl / # 重新挂载根分区，并挂载加入ACL权限

### 永久开启分区ACL权限

vim /etc/fstab

UUID=\*\* / ext4 defaults,acl 1 1  # 加入 ACL
mount -o remount / # 重新挂载文件系统或重启系统，使修改生效

### 查看ACL

getfacl file\_name

### 设定ACL

setfacl option file\_name

- -m   设定ACL权限
- -x   删除指定ACL权限
- -b   删除所有ACL权限
- -d   设定默认ACL权限
- -k   删除默认ACL权限
- -R   递归设定ACL权限

useradd tony
groupadd stu
mkdir /home/dir
chown tony:stu /home/dir
chmod 770 /home/dir
user lw
setfacl -m u:lw:rx /home/dir # u:user\_name:rwx g:group\_name:rwx

### 最大有效权限 mask

mask 指定最大有效权限
给用户赋予了ACL权限后，需要和mask“相与”才能得到用户的真正权限

### 删除ACL权限

setfacl -x u:lw /home/dir # 删除指定用户
setfacl -b /home/dir    # 删除全部

### 递归ACL权限

setfacl -m u:lw:rx -R /home/dir

权限溢出 x 对于目录和文件的意义不同

### 默认ACL权限

默认ACL权限的作用：
如果父目录设定了默认ACL权限，那么其中所有新建子文件都会继承父目录的ACL权限

setfacl -m d:u:user\_name:rwx file\_name

## sudo

- root 把本来只能超级用户执行的命令赋予普通用户执行
- sudo 操作对象是系统命令

visudo # 修改/etc/sudoers文件

root ALL=(ALL) ALL
user\_name 被管理主机的地址=(可使用的身份,可以省略)授权命令(绝对路径)

%wheel ALL=(ALL) ALL
%group\_name 被管理主机的地址=(可使用的身份)授权命令(绝对路径)

user1 ALL=(ALL) /usr/bin/shutdown -r now

sudo -l # 查看可用的sudo命令

user1 ALL=/usr/sbin/useradd
user1 ALL=/usr/bin/passwd

user1 ALL=/usr/bin/passwd [A-Za-z]\*, !/usr/bin/passwd "", !/usr/bin/passwd root
不允许设定root用户的密码

user1 ALL=/usr/vi  # 灾难性后果，以root身份编辑一切文件

## 特殊权限

尽量不要自己手动去改，安全风险很大

### SetUID

仅对文件设定

- 只有可以执行的二进制程序才能设定SUID权限 s=S+x
- 命令执行者要对该程序拥有x权限
- 命令执行者在执行该程序时获得该程序文件属主的身份
- SetUID权限只在该程序执行过程中有效，即身份改变只在程序执行过程中有效

ls -l /usr/bin/passwd

passwd 命令拥有SetUID权限，所以普通用户可以修改自己的密码
cat 命令没有SetUID权限，所以普通用户不能查看/etc/shadow文件内容

4 代表SUID
chmod 4755 file\_name
chmod u+s file\_name
chmod 0755 file\_name
chmod u-s file\_name

- 关键目录应严格控制写权限 "/" "/usr"
- 用户的密码设置要严格遵守密码三原则
- 对系统中默认应该具有SetUID权限的文件作一列表，定时检查有没有这之外的文件被设置了SetUID权限

find / -perm -4000 -o -perm -2000 > setuid.log

### SetGID

文件／目录都可以设定

- 只有可执行的二进制程序才能设置SGID权限 s=S+x
- 命令执行者要对该程序拥有x权限
- 命令执行者在执行程序的时候，组身份升级为该程序文件的属组
- SetGID 权限同样只在该程序执行过程中有效


- 普通用户必须对此目录拥有r+x权限，才能进入此目录
- 普通用户在此目录中的有效组会变成此目录的属组
- 若普通用户对此目录拥有w权限，新建的文件的默认属组是这个目录的属组

2 代表 sgid

### Sticky BIT

粘着位 权限

- 粘着位目前只对目录有效
- 普通用户对该目录拥有w和x权限，即普通用户可以在此目录拥有写入权限
- 如果没有粘着位，因为普通用户拥有w权限，所以可以删除此目录下所有文件，包括其他用户建立的文件。
- 一旦赋予了粘着位，除了root可以删除所有文件，普通用户就算拥有w权限，也只能删除自己建立的文件，不能删除其他用户建立的文件。

chmod 1755 /user/home
chmod o+t /user/home

chmod 0777 /user/home
chmod o-t /user/home

## 不可改变位权限

chattr \[+-=\] \[option\] file\_name

- + 增加权限
- - 删除
- = 赋值

option 
- i insert
- a append

lsattr [-d] file\_name
