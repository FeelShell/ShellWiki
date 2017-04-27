# 扫描技术

网络安全技术

保障数据在互联网的真实、可靠、完整、可控性传输与存储。

1. tracert 路由
2. nmap 批量主机服务扫描
3. 暴力破解 弱口令进行登录
4. nc -lvp 2005
5. 可以进行任意的操作

网络入侵方式
踩点->网络扫描->查点->提权

## 主机扫描

### fping

批量的给目标主机发送ping请求，测试主机的存活情况

特点：
并行发送、结果易读

#### source install

http:///fping.org

wget http://fping.org/dist/\*.tar.gz
tar -xvf \*.tar.gz

cd fping-\*
./configure
make
make install

fping -h
fping -v

#### parameters

- -a 只显示存活的主机（相反-u）

fping + IP1 + IP2

- -g 通过主机段方式

fping -f filename

### hping

支持 TCP／IP数据包的组装、分析工具

http://www.hping.org/
file master

libpcap-devel install
rpmfind.net
./configure
make & make install

一、对指定目标端口发起TCP探测

- -p 端口
- -S 设置TCP模式SYN包

二、伪造来源IP，模拟Ddos攻击

- -a 伪造IP地址

#### Example

host1$ netstat -ltn
host2$ hping -p 22 -S 10.10.163.233
host1$ sysctl -w net.ipv4.icmp\_echo\_ignore\_all=1 # 阻止icmp的ping
host2$ hping -u 10.10.163.233
host2$ hping -p 22 -S 10.10.163.233 # can connect
host1$ tcpdump -np -ieth1
host1$ tcpdump -np -ieth1 src host 10.10.163.232
host2$ hping -p 22 -S 10.10.163.233 -a 10.10.163.235
host1$ tcpdump -np -ieth1 src host 10.10.163.232

## 路由扫描

作用：查询一个主机到另一个主机的经过的路由的跳数、及数据延迟情况。

### traceroute

traceroute --help

一、默认使用UDP协议（30000上的端口）
二、使用TCP协议 -T -p
三、使用ICMP协议介绍 -I

### mtr

能测试出主机到每一个路由间的连通性

mtr --help
mtr www.imooc.com

## 批量服务扫描

目的：
1. 批量主机存活扫描
2. 针对主机服务扫描

作用：
1. 能更方便快捷获取网络中主机的存活状态
2. 更加细致、智能获取主机服务侦查情况

### nmap

nmap -sP 10.10.140.0/24 # ping 扫描

target$ netstat -ltpn
attacker$ nmap -sS target.ip # TCP 半开放扫描
attacker$ nmap -sS -p 0-30000 target.ip
attacker$ nmap -sT -p 0-30000 target.ip # TCP 全开放扫描
attacker$ nmap -sU target.ip # UDP

### ncat

瑞士军刀

组合参数
- -w 设置的超时时间
- -z 一个输入输出模式
- -v 显示命令执行过程

tcp(default)
nc -v -z -w2 10.10.250.254 1-50
udp
nc -v -u -z -w2 10.10.250.254 1-50

attacker$ nc -v -z -w2 target.ip 1-200
attacker$ nc -v -u -z -w2 target.ip 1-200

## Linux 防范恶意扫描安全策略

常见攻击方法

### SYN攻击

利用TCP协议缺陷进行，导致系统服务停止响应，网络带宽跑满或者响应缓慢。

方式一、减少发送syn+ack包时重试次数
sysctl -w netipv4.tcp\_synack\_retries=3
sysctl -w netipv4.tcp\_syn\_retries=3

方式二、SYN cookies 技术
sysctl -w net.ipv4.tcp\_syncookies=1

方式三、增加backlog队列
sysctl -w net.ipv4.tcp\_max\_syn\_backlog=2048

### DDOS攻击

分布式拒绝访问攻击

### 恶意扫描 

### 其他策略

一、关闭ICMP协议请求
sysctl -w net.ipv4.icmp\_echo\_ignore\_all=1

二、iptables 防止扫描

