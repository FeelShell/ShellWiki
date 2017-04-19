# Bash 变量

Shell 是用来简化管理操作的

Bash 中，变量的默认类型是字符串型

## 用户自定义变量

### 变量定义
变量名=变量值
> = 两侧不能加空格
> 值内有空格，用 "" 括起来

### 变量调用

$var\_name

### 变量叠加

$x
x="$x"456
x=${x}789

```shell
# 查询所有变量
set

# 如果为设置，报错
set -u

# delete variable, do not add $
unset var_name
```

## 环境变量

环境变量是全局变量, 在当前Shell和这个Shell的所有子Shell中生效
用户自定义变量是局部变量，只在当前的Shell中生效

大写

```shell
export var_name=var_value

var_name=var_value
export var_name

# 查看所有变量
set

# 查看环境变量
env

unset var_name
```

### 常用环境变量

HOSTNAME
SHELL
TERM
HISTSIZE
SSH_CLIENT
SSH_TTY
USER

PATH 系统查找命令的路径
PATH="$PATH":/root/sh

### PS1 环境变量

PS1变量:命令提示符设置
- \d   显示日期 “星期 月 日”
- \H   显示完整的主机名 “localhost.localdomain”
- \t   显示24小时制时间 "HH:MM:SS"
- \A   显示24小时制时间 "HH:MM"
- \u   显示当前用户名
- \w   显示当前所在目录的完整名称
- \W   显示当前所在目录的最后一个目录
- \$   提示符

PS1='[\u@\h \W]\$ ' # 用户提示符

### 语系变量

locale
查询当前系统语系
- LANG     定义系统主语系的变量
- LC\_ALL  定义整体语系的变量

echo $LANG
echo $LC\_ALL

LANG=en\_US.UTF-8
LANG=zh\_CN.UTF-8

locale -a
支持的所有语系

/etc/sysconfig/i18n

### Linux 中文支持

前提条件 正确安装的中文字体和中文语系
- 如果有图形界面，可以正确支持中文显示
- 如果使用第三方远程工具，只要语系设置正确，可以支持中文显示
- 如果使用纯字符界面，必须使用第三方插件(zhcon)


## 位置参数变量

预定义变量的一种

$n     n为数字，$0代表命令本身，$1-$9 ${10} 代表参数
$\*    代表命令行中所有的参数，把所有的参数看成一个整体
$@     代表命令行中所有的参数，把每个参数区分对待
$#     代表命令行中所有参数的个数

向脚本传递值

## 预定义变量

$?    最后一次执行的命令的返回状态， 0 执行正确； 非0 执行错误
$$    当前进程的进程号 PID
$!    后台运行的最后一个进程的进程号 PID

## 接收键盘输入

read [option] [var\_name]
- -p    "提示信息" prompt 等待read输入时，输出提示信息
- -t    秒数 read 命令会一直等待用户输入，使用此选项可以指定等待时间
- -n    字符数 read 命令只接收指定的字符数，就会执行
- -s    隐藏输入的数据，适用于机密信息的输入

read -p "your name : " -t 30 -s -n 5 name
echo -e "\n" # 换行
echo $name
