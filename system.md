# 系统管理

## 进程管理

进程是正在执行的一个程序或命令，每一个进程都是一个运行的实体，都有自己的地址空间，并占用一定的系统资源。

### 进程管理的作用
- 判断服务器健康状态
- 查看系统中所有进程
- 杀死进程

### 查看进程

ps aux
ps -le

- a    显示一个终端的所有进程，除了会话引线
- u    显示进程的归属用户及内存的使用情况
- x    显示没有控制终端的进程
- -l   长格式显示，详细信息
- -e   显示所有进程，-A 作用一致

USER PID %CPU %MEM VSZ RSS TTY STAT START TIME COMMAND

VSZ   该进程占用的虚拟内存的大小，单位 KB
RSS   该进程占用实际物理内存的大小，单位KB
TTY   该进程在哪个终端运行。tty1-tty6 本地的字符界面终端;tty7图形终端;pts/0-255代表虚拟终端 Linux2.6 65536
STAT  S Sleep;s 包含子进程
TIME  耗费CPU运算时间

pstree [option]
- -p 显示进程PID
- -u 显示进程所属用户

top [option]
- -d 秒数 指定top命令每隔几秒更新 default 3
- -b 使用批处理模式输出，一般和`-n`选项合用
- -n 次数 指定top命令执行的次数，一般和`-b`选项合用
- 交互模式
> - ?或h 显示交互模式的帮助
> - P 以CPU使用率排序，默认就是此项
> - M 以内存使用率排序
> - N 以PID排序
> - q 退出

- 任务队列信息
12:26:46                             系统当前时间
up 1 day, 13:32                      系统的运行时间
2 users                              当前登录了2个用户
load average: 0.00, 0.00, 0.00       系统在之前1分钟，5分钟，15分钟的平均负载；<1 负载较小；>1超出负荷; 按CPU核数计算

- 进程信息
Tasks : 95 total                     系统中的进程总数
1 running                            正在运行的进程数
94 sleeping                          睡眠的进程
0 stopped                            正在停止的进程
0 zombie                             僵尸进程。如果不是0，需要手工检查僵尸进程

- CPU信息
Cpu(s):  0.1%us                      用户模式占用的CPU百分比
0.1%sy                               系统模式占用的CPU百分比
0.0%ni                               改变过优先级的用户进程占用的CPU百分比
99.7%id                              空闲CPU的CPU百分比
0.1%wa                               等待输入／输出的进程的占用CPU百分比
0.0%hi                               硬中断请求服务占用的CPU百分比
0.1%si                               软中断请求服务占用的CPU百分比
0.0%st                               Steal time 虚拟时间百分比

```shell
top -b -n 1 > top.log
```

#### buffer VS. cache

buffer 加速写入
cache  加速读取


#### 关注指标
load
cpu  
mem free
swap free

### kill proc

#### kill 杀死单一进程

```shell
kill -l # 查看可用的进程信号
#
# 平滑重启， 重新读取配置文件
kill -1 1523
kill -HUB 1523

# 强制重启
kill -9 1523

# default
kill 1523
kill -15 1523
```

#### killall

killall [option] [signal] proc\_name # 按照进程名杀死进程
-i 交互式，询问是否要杀死某个进程
-I 忽略进程名的大小写

#### pkill

pkill [option] [signal] proc\_name # 按照进程民终止进程
-t 终端号，按照终端号踢出用户

pkill -9 -t pts/1

### Alter Proc Priority
PRI Priority
NI Nice
都是优先级，数字越小代表该进程优先级越高

用户只能修改 NI , 不能直接修改 PRI
NI -20 ~ 19

PRI = PRI + NI

nice [option] command
nice -n -5 service httpd start

renice [pri] pid
renice -10 1845

## 工作管理

## 系统资源查看

## 系统定时任务

