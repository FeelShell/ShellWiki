# 智能DNS服务搭建之Bind服务

## Bind Service

1. 域名解析服务
2. 权威域名服务
3. DNS工具

### DNS 记录分类

- A
- CNAME
- NS
- MX

### Install

```shell
yum install bind bind-chroot

sudo apt-get install bind9

rpm -qa | grep bind
rpm -ql | grep bind
```

### Config

```shell
/etc/init.d/named

ps -aux | grep named

vim /etc/named.d
```

- options {} 整个BIND使用的全局选项
- logging {} 服务日志选项
- zone . {} DNS域解析

```shell
vim /etc/named.d

options{
    directory "/var/named";
};

zone "imooc.com" {
    type master;
    file "imooc.com.zone";
};

vim /var/named/imooc.com.zone

$TTL 7200
imooc.com. IN SOA imooc.com. lbk.immoc.com. (222 1H 15M 1W 1D)
imooc.com. IN NS dns1.imooc.com.
dns1.imooc.com. IN A 10.156.11.232
www.immoc.com. IN A 2.2.2.2

/etc/init.d/named restart

dig @10.156.11.232 www.imooc.com

nslookup www.baidu.com
```

@ 是DNS记录中的保留字，表示当前域名
记录不准许折行书写
单行记录不允许有空格或TAB开头

## Tools

vim /etc/resolv.conf

host www.imooc.com
host -t SOA baidu.com
host -t NS baidu.com
host -t A baidu.com

nslookup www.imooc.com
nslookup # 交互模式
\> set q=soa

dig @dns\_service www.imooc.com
dig -x ip @dns\_service
dig -t a baidu.com



