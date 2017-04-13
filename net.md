# Network

## Basic

### ISO / OSI 七层模型

- 应用层
- 表示层
- 会话层
- 传输层
- 网络层
- 数据链路层
- 物理层

### TCP/IP 四层模型

#### 网络接口层

- 物理层
- 数据链路层

1. ARP 地址解析协议
arp -a

#### 网际互连层

- 网络层

1. IP (网际协议)
2. IGMP（互联网组管理协议）
3. ICMP（互联网控制报文协议）(ping)

#### 传输层

- 传输层

1. TCP
2. UDP

三次握手 ／ 两军问题

#### 应用层

- 应用层
- 表示层
- 会话层

1. FTP
2. SSH

### IP

A\B\C

私有地址
10
172
192.168

### Mask

A 255.0.0.0
B 255.255.0.0
C 255.255.255.0

变长子网掩码及子网规划

### Port

0 ~ 65535 2^16

FTP 20 21
SSH 22
telnet 23 明文 不安全 关闭
DNS 53
HTTP 80
SMTP 25
POP3 110

netstat -an

- -a 查看所有连接和监听端口
- -n 显示IP地址和端口号，而不显示域名和服务名

### DNS

hosts file 静态 IP 域名 映射 优先级高于DNS解析

早期Hosts文件解析域名
- 名称解析效能下降
- 主机维护困难

DNS服务
- 层次性
- 分布式

递归查询
迭代查询

### Gateway

1. 网间连接器、协议转换器
2. 在网络层以上实现网络互连，是最复杂的网络连接设备，仅用于两个高层协议不同的网络互连。
3. 既可以用于广域网互联，也可以用于局域网互联。
4. 一种充当转换重任的服务器或路由器。

交换机是数据链路层设备，不识别IP，只识别MAC

服务器搭建路由功能

作用
1. 网关在所有内网计算机访问的不是本网段的数据报时使用；
2. 网关负责把内网IP转换为公网IP，公网IP转换为内网IP。

## Config

### IP Config

#### ifconfig

临时配置

ifconfig eth0 192.168.254.200 netmask 255.255.255.0

#### setup

永久配置 / RedHat 专有系列

service network restart

### Config File

#### 网卡信息文件

/etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE=eth0                                       网卡设备名
BOOTPROTO=none                                    是否自动获取IP(none static dhcp)
HWADDR=00:0c:29:17:c4:09                          MAC地址
NM\_CONTROLLED=yes                                是否可以由Network Manager图形管理工具托管
ONBOOT=yes                                        是否随网络服务启动，eth0生效
TYPE=Ethernet                                     类型 以太网
UUID="44b76c8a-b59f-44d5-83fa-7f98fda86b3d"       惟一识别码
IPADDR=192.168.0.1                                IP地址
NETMASK=255.255.255.0                             子网掩码
GATEWAY=192.168.0.1                               网关
DNS1=202.106.0.20                                 DNS
IPV6INIT=no                                       IPv6没有启用
USERCTL=no                                        不允许非root用户控制此网卡

#### 主机名文件

/etc/sysconfig/network

NETWORKING=yes
HOSTNAME=localhost.localdomain

hostname newname
hostname

#### DNS 配置文件

/etc/resolv.conf

nameserver 202.106.0.20
search localhost

### Server Config

UUID 更新

## Commands

## Tools
