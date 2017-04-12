# 用户管理

用户：使用操作系统的人
用户组：具有相同系统权限的一组用户

/etc/group 存储当前系统中所有用户组的信息
Group :     x      :  123 :abc,def,xyz
组名称:组密码占位符:组编号:组中用户名列表

1. 当组内只有一个用户，且用户名和组名相同，可以省略组名
2. root 组号 0
3. 1~499 系统预留软件或服务
4. 用户手动创建500开始
5. 组密码占位符 x *

/etc/gshadow 存储当前系统中用户组密码信息
Group :  \*  :        :abc,def,xyz
组名称:组密码:组管理者:组中用户名列表

/etc/passwd 存储当前系统中所有用户的信息
user  : x        :   123  :   456    :  xxxx      :/home/user:/bin/bash
用户名:密码占位符:用户编号:用户组编号:用户注释信息:用户主目录:shell类型

/etc/shadow 存储当前系统中所有用户的密码
user  :vf;zu8sdf...:::::
用户名:密码        :::::

groupadd group\_name
groupmod -n new\_name group\_name
groupmod -g 668 group\_name
groupadd -g 888 group\_name
groupdel group\_name

useradd -g group\_name user\_name
useradd -d /home/xxxx user\_name

usermod -c note user\_name
usermod -l new\_name name
usermod -d /home/xxx name
usermod -g group\_name user\_name

userdel user\_name
userdel -r user\_name # 删除目录


touch /etc/nologin # 禁止root账户以外的用户登录

passwd -l user\_name # lock user
passwd -u user\_name # unlock user
passwd -d user\_name # no pwd login

用户可以同时属于多个组
- 一个主要组
- 多个附属组

gpasswd -a user\_name side\_group\_name # , connect more 添加附属组
gpasswd -d user\_name side\_group\_name # , connect more 取消附属组

newgrp group\_name # 切换到附属组

useradd -g group1 -G group2,group3,...

gpasswd group\_name # set group pwd

su user\_name

whoami
id user\_name
groups user\_name

chfn user\_name # 设置用户详细资料
finger user\_name # 显示用户详细资料
