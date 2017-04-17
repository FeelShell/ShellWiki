# 服务管理

## 简介与分类

### 系统的运行级别

- 0  关机
- 1  单用户模式，可以想象为Windows的安全模式，主要用于系统修复
- 2  不安全的命令行模式，不含NFS服务
- 3  完全的命令行模式，就是标准字符界面
- 4  系统保留
- 5  图形模式
- 6  重启动

```shell
# check level
\# runlevel
N 3

# alter
\# init 5

# shutdown no secure
\# init 0

# restart no secure
\# init 6

# edit config file
\# vim /etc/inittab
```

### 服务的分类
                                |->独立的服务
          |->RPM包默认安装的服务->
          |     ^               |->基于xineted服务
Linux服务->     |
          |-> 源码包安装的服务

服务器的优化 -> 服务的管理 -> 停用无用的服务，节省内存空间

#### 独立的服务

独立的运行在内存中

USER -> SERVER MEM 

响应快，但是占内存

#### xinetd

超级守护进程

user -> xinetd 服务 ->  后台程序

响应慢，不占过多内存，逐渐被淘汰


#### 查询已安装的服务

- RPM 包安装的服务
\# 查看服务自启动状态，可以看到rpm包安装的服务
chkconfig --list

- 源码包安装的服务
查看服务位置，一般在`\usr/local/`下

#### 启动与自启动

### 服务与端口

``` shell
ps aux
```

Port 65536 0-65535

TCP 65536
UDP 65536

一般情况下，TCP/UDP 端口授予同一个应用

/etc/services

#### 查询系统中开启的服务

netstat -tlunp
- -t tcp
- -u udp
- -l listening
- -p pid
- -n 用端口号来显示服务，而不是服务名

netstat -an
- -a all

## 独立服务的管理

usr Unix System Resource

RPM 默认位置
- /etc/init.d/       启动脚本位置
- /etc/sysconfig/    初始化环境配置文件位置
- /etc//             配置文件位置
- /etc/xinetd.conf   xinetd配置文件
- /etc/xinetd.d/     基于xinetd服务的启动脚本
- /var/lib/          服务产生的数据在这里
- /var/log/          日志

/etc/init.d/独立服务名 start|stop|status|restart

/etc/rc.d/init.d/

service 独立服务名 start|stop|status|restart
> 只有RedHat系列才有service命令

chkconfig --level 2345 httpd on
chkconfig httpd on
chkconfig httpd off

vim /etc/rc.d/rc.local
/etc/init.d/httpd start

两种方法，只能选其一，否则两次启动会报错，文件更简单

netsysv == chkconfig

## 基于xinetd服务管理

yum install xinetd # 了解即可

rsync

vim /etc/xinetd.d/rsync
service	xinetd restart
chkconfig rsync on

## 源码包服务管理

启动 绝对路径

自启动 一种方法 vim /etc/rc.d/rc.local

### 源码包 被 service 识别

创建软链接 ln -s absolute\_path /etc/rc.d/init.d/


### 源码包 被 chkconfig 识别

ls /etc/rc3.d/ Kill Start

vim /etc/init.d/apapche

\# chkconfig: 35 86 76 # 运行级别 启动顺序号 关闭顺序号
\# description: source package apache

chkconfig --add apachectl
