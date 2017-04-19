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

工作管理指的是在单个登录终端中（也就是登录的SHELL界面中）同时管理多个工作的行为。

- 当前登录终端，只能管理当前终端的工作，而不能管理其他登录终端的工作
- 放入后台的命令必须可以持续运行一段时间，这样我们才能捕捉和操作这个工作
- 放入后台执行的命令不能和前台用户有交互或需要前台输入，否则放入后台只能暂停，而不能执行

```shell
# list all the background job
jobs [-l]
# -l 显示PID

# method 0
# 把命令放入后台，并执行
tar -zcf etc.tar.gz /etc &
# method 1
# 按下 CTRL+Z 快捷键，放入后台暂停

# + 代表最近一个放入后台的工作，也是工作恢复时，默认恢复的工作
# - 代表倒数第二个放入后台的工作

# 恢复到前台
# % 可以省略
fg %job_ID

# 暂停的工作恢复到后台执行
bg %job_ID

# 恢复最近一个 +
fg
bg
```

### 后台命令脱离命令终端执行

deamon 守护进程

- method 0
/etc/rc.local
touch /var/lock/subsys/local
写在这个位置，系统启动时执行

- method 1
系统定时任务

- method 2
nohup

```shell
nohub [command] &
```

## 系统资源查看

```shell
# vmstat [刷新延迟 刷新次数]
vmstat 1 3

# procs
# r 等待运行的进程数，数量越大，系统越繁忙
# b 不可被唤醒的进程数，数量越大，系统越繁忙

# 开机时，内核检测信息
dmesg | grep CPU

# 查看内存使用状态 
free [option]
# -b  Byte
# -k  KB
# -m  MB
# -g  GB

# 查看 CPU 信息
cat /proc/cpuinfo

uptime

uname -a
# 内核
uname -r
uname -s

# 查看操作系统位数
file /bin/ls

# 查看发行版
ls_release -a

# 查看进程调用的文件 或 文件调用的进程
lsof

# 查询系统中所有进程调用的文件
lsof | more

# 查询某个文件被哪个进程调用
lsof /sbin/init

# 查看httpd进程调用了哪些文件
lsof -c httpd

# 按照用户名查询某用户的进程调用的文件名
lsof -u root

```

## 系统定时任务

