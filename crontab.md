# crontab

- 每分钟需要执行一个程序检查系统运行状态
- 每天凌晨需要对过去一天的业务数据进行统计
- 每个星期需要把日志文件备份
- 每个月需要把数据库进行备份

`crontab` 是一个用于设置周期性被执行的任务的工具

> - cron job     被周期性执行的任务
> - cron table   被周期性执行的任务列表

> http://www.putty.org

## install

```shell
# check install
crontab -l

# check start
service crond status

# install
yum install vixie-cron
yum install crontabs

```

## sample

每分钟打印当前时间到一个日志文件中

- \*/1 \* \* \* \* date >> log.txt

```shell
crontab -e

>> */1 * * * * date >> log.txt

:wq

crontab -l

tail -f log.txt
tail -3 log.txt
tail log.txt
```

## 组成

- crond         系统服务 每分钟都会从配置文件刷新定时任务
- config file   文件方式设置定时任务
- crontab       用于调整定时工具

## config file

\* \* \* \* \* user-name COMMAND
 |  |  |  |  |--> 星期0~7
 |  |  |  |-->月份1~12
 |  |  |-->日期1~31
 |  |-->小时0~23
 |-->分钟0~59

- 每晚的21:30 重启 APACHE
> 30 21 * * * servcie httpd restart

- 每月 1 10 22 日的 4:45 重启 APACHE
> 45 4 1,10,22 * * service httpd restart

- 每月1到10日的	4:45 重启 APACHE
> 45 4 1-10 * * service httpd restart

- 每隔2分钟重启 APACHE 
> \*/2 * * * * service httpd restart
> 1-59/2 * * * * service httpd restart

- 晚上11点到早上7点之间，每隔一小时重启APACHE
> 0 23-7/1 * * * service httpd restart

- 每天18:30～23:00之间每隔30分钟重启Apache
> 0,30 18-23 * * * service httpd restart
> 0-59/30 18-23 * * * service httpd restart

```shell
ls /etc/cron*

crontab syssta
```

- /etc/cron\*
- /var/spool/cron\*
- /var/log/cron\*
- /var/spool/mail


## error

### 环境变量

vim .bash\_profile
其中的变量并没有在crontab中起作用

### 第三和第五个域之间执行的是"或"操作

- 4月的第1个星期日早晨1小时59分运行a.sh
> 59 1 1-7 4 0 /root/a.sh  # error
> 59 1 1-7 4 * test \`date +\%w\` -eq 0 && /root/a.sh # right

### 分钟数设置误用

- 两小时运行一次

> \* \*/2 \* \* \* date # error
> 0 \*/2 \* \* \* date  # right

### 补充

- crontab 最小只能设置到每分钟执行一个命令，如果想没半分钟执行某个命令：
> - 通过shell脚本的sleep命令配合crontab即可完成这一功能
> - date && sleep 0.5s && date
