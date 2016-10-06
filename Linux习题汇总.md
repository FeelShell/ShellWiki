# Linux 习题汇总

## Linux 常用命令

### 文件处理命令

1、ls -al ~表示什么?

> **ls**

> list directory contents

> -a  :  do not ignore entries starting with .

> -l  :  use a long listing format

2、-rw-r--r-- 表示什么类型的文件，文件所有者、所属组、其他人分别拥有什么权限?

> - -文件类型(-普通文件，d目录，l软链接文件)

> - rw- r-- r--
> - u g o
> - u所有者、g所属组、o其他人
> - r读、w写、x执行 、-表示没有权限

3、mkdir -p /tmp/China/java 表示什么?

> **mkdir**

> make directories

> -p    :   no error if existing, make parent directories as needed

4、cd .. 、cd - 、cd . 、cd ~分别表示什么意思?

> **cd**

> change the shell working directory

> *cd ..* 上一级目录

> *cd -* 前一个工作目录

> *cd .* 当前目录

> *cd ~* 用户目录

5、pwd的功能是什么?

> **pwd**

> print name of current/working directory

> 显示当前目录

6、rmdir /tmp/China/java的功能是什么?

> **rmdir**

> remove empty directories

> 删除空目录，如果目录为空则删除，否则，删除失败

7、cp -rp /Src /Target 的功能是什么?

> **cp**

> Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY

> -r  :  copy directories recursively, 复制目录

> -p  :  same as --preserve=mode,ownership,timestamp, 保留文件属性

> --preserve[=ATTR_LIST]    preserve the specified attributes (default: mode,ownership,timestamp), if possible additional attributes: context, links, xattr, all

8、“将目录/tmp/China/java复制到目录/root下”该执行什么命令?

```
# cp -r /tmp/China/java /root
```

9、“将目录/tmp/China/目录下的csharp和java复制到目录/root下，并保持目录属性”该执行什么命令?

```
# cp -rp /tmp/China/csharp /tmp/China/java /root
```
10、“将abc.txt文件更名为xyz.txt”该执行什么命令?

```
# mv abc.txt xyz.txt
```

11、“删除目录/tmp/China/java”该执行什么命令?

```
# rm –rf /tmp/China/java
```

12、touch boy girl的功能是什么?

> **touch**

> change file timestamps

> Update the access and modification times of each FILE to the current time.

> A FILE argument that does not exist is created empty, unless -c or -h is supplied

> linux的touch命令不常用，一般在使用make的时候可能会用到，用来修改文件时间戳，或者新建一个不存在的文件。

13、cat –n /etc/services的功能是什么?

> **cat**

> concatenate FILES and print on the standard output

> -n : number all output lines

14、more /etc/services的功能是什么?

> **more**

> A filter for paging through text one screenful at a time.

> This version is especially primitive.

> Users should realize that `less` provides `more` emulation plus extensive enhancements.

> 分页显示文件内容

15、less /etc/services的功能是什么?

> **less**

> 分页显示文件内容(可向上翻页)

16、head –n 20 /etc/services的功能是什么?

> **head**

> Print the first 10 lines of each FILE to standard output.

> With more than one FILE, precede each with a header giving the file name.

> -n=[-]NUM : print the first NUM lines instead of the first 10; with the leading '-', print all the last NUM bytes of each file.

17、tail -f /var/log/messages的功能是什么?

> **tail**

> Print the last 10 lines of each FILE to standard output.

> With more than one FILE, precede each with a header giving the file name.

> -f : output appended data as the file grows, 动态显示文件末尾内容

18、“创建文件/etc/issue的软链接/tmp/issue.soft”该执行什么命令?

```
# ln -s /etc/issue /tmp/issue.soft
```

19、“创建文件/etc/issue的硬链接/tmp/issue.hard”该执行什么命令?

```
# ln /etc/issue /tmp/issue.hard
```

20、请分别说出软链接和硬链接的特点。

软连接特征:类似Windows快捷方式
> - 1、lrwxrwxrwx. l软链接
> - 2、文件大小-只是符号链接
> - 3、/tmp/issue.soft -> /etc/issue

硬链接特征:实时备份(用的较少)
> - 1、复制cp -p+同步更新
```
#echo “Welcome to Neu” >> /etc/issue
```
> - 2、通过i节点识别(与源文件节点号相同)
> 1个i节点可以映射到多个文件
> - 3、不能跨分区
> - 4、不能针对目录使用

### 权限管理命令

- r----------------4
- w----------------2
- x----------------1

21、用数字表示rwxrw-r--的结果是什么?

764

22、“赋予文件testfile所属组写权限”该执行什么命令?

```
$ chmod 020 testfile
```
23、“修改目录testfile及其目录下文件为所有用户具有全部权限”该执行什么命令?

```
$ chmod -R 777 testfile
```

24、请思考进入目录/tmp/test/需要什么权限?

读权限 w

25、“改变文件abc的所有者为lisi”该执行什么命令?

```
# chown lisi.root abc
```

26、“改变文件xyz的所属组为zhangsan”该执行什么命令?

```
# chgrp zhangsan xyz
```

27、umask命令的功能是什么?如果umask的结果是0022，新建文件夹abc和新建的文件xyz 用户、所属组、其他人的权限分别是什么?

> **umask**

> 显示、设置文件的缺省权限

>

### 文件搜索命令

28、“在目录/etc中查找文件init”该执行什么命令?

```
$ find /etc/ -name init
```

29、“在根目录下查找大于100MB的文件”该该执行什么命令?(提醒:1个数据块等于512字节)

```
# find / -size +204800 
```

30、“在普通用户家目录下查找所有者为zhangsan的文件”该执行什么命令?

```
# find /home -user zhangsan 
```

31、find /etc -name \*init\*的功能是什么?

在 `/etc` 文件夹下查找文件名包含 `init` 的文件

32、find /etc -iname init???的功能是什么?

在 `/etc` 文件夹下查找文件名以 `init` 开头的文件，文件名长度为7

33、“在/etc下查找5分钟内被修改过属性的文件和目录”该执行什么命令?(提醒:-cmin表示修改过文件属性 )

```
# find /etc -cmin -5 
```

34、“在/etc下查找大于80MB小于100MB文件”该执行什么命令?(提醒:-a是并列，-o是选择满足)

```
# find /etc -size +163840 -a -size -204800 
```

35、“在/etc下查找inittab文件并显示其详细信息”该执行什么命令?(提醒:-exec表示直接执行，{}代表结果，\;表示执行结果)

```
# find /etc -name inittab -exec ls –l {} \; 
```

36、find /etc -name init* -a -type f的功能是什么?

在 `/etc` 文件夹下查找文件名以`init`开头，并且类型为文件的文件

37、updatedb能收录/tmp目录的文件记录吗?

/tmp目录不在updatedb收录范围 

38、locate xyz的功能是什么?

> **locate**
> 
> The locate program searches a database for all pathnames which match the specified pattern.
> The database is recomputed periodically (usually weekly or daily), and contains the pathnames of all files which are publicly accessible.

39、which rm的功能是什么?

搜索命令`rm`所在目录及别名信息 

40、whereis ls的功能是什么?

搜索命令`ls`所在目录及帮助文档路径 

41、grep -v ^# /etc/inittab的功能是什么?

> **grep**
>  The grep utility searches any given input files, selecting lines that match one or more patterns. 
> By default, a pattern matches an input line if the regular expression (RE) in the pattern matches the input line without its trailing newline.
> An empty expression matches every line.
> Each input line that matches at least one of the patterns is written to the standard output.
> 

去除以#开头的所有行

### 帮助命令

42、man ls的功能是什么?

查看ls命令的帮助信息

43、ls --help的功能是什么?

显示常见的选项

44、whatis ls的功能是什么?

命令简短信息 

### 用户管理命令(简版，详情见 )

45、“添加一个新用户wangwu”该执行什么命令?

```
# useradd wangwu
```

46、“给上一题的wangwu用户设置密码”该执行什么命令?

```
# passwd wangwu 
```

46、“查看用户登录信息”该执行什么命令?

```
# who
```

47、“查看登录用户详细信息”该执行什么命令?

```
# w
```

### 用户和用户组管理

48、“查看当前系统运行时间，目前有多少用户登录，在过去的1分钟、5分钟和15分钟系统 平均负载情况”该执行什么命令?


### 压缩解压缩命令

49、“将China目录打包并压缩成China.tar.gz文件”该执行什么命令?

```
# tar -zcf China.tar.gz China 
```

50、“将java.tar.gz压缩文件解压到/root/目录”该执行什么命令?

```
# tar -zxvf java.tar.gz -C /root/ 
```

### 网络命令

51、“给在线用户lisi发送Hello”该执行什么命令?

```
# write lisi
```

52、“给所有用户发送I am a good man!”该执行什么命令?

```
# wall I am a good man! 
```

53、“测试本机与192.168.1.2主机的连通性”该执行什么命令?

```
# ping 192.168.8.2 
```

54、“查看当前主机的网卡属性”该执行什么命令?

```
# ifconfig
```

55、“给lisi发送一封主题为01，内容为test的邮件”该执行什么命令?


56、“列出登录操作系统的用户信息的历史”该执行什么命令?

```
# last
```

57、lastlog -u 500的功能是什么?

检查用户500上次登录的时间

58、traceroute 123.123.123.11的功能是什么?

显示数据包到主机123.123.123.11间的路径 

59、“查看本机监听的端口”该执行什么命令?

```
# netstat -tlun
```

60、“查看本机所有的网络连接”该执行什么命令?

```
# netstat –an 
```

61、“查看本机路由表”该执行什么命令?

```
# netstat -rn
```

62、service network restart的功能是什么?

重启网络服务

### 关机重启命令

63、shutdown -h now的功能是什么?

立即关机

64、init 0的功能是什么?

关机

65、runlevel的功能是什么?

查询系统运行级别 

66、CentOS6.4中/etc/inittab文件的作用是什么?

init进程是系统所有进程的起点，Linux在完成核内引导以后，就开始运行init程序。
init程序需要读取配置文件/etc/inittab。
inittab是一个不可执行的文本文件，它有若干行指令所组成。

## vi编辑器

1、“给文档设置行号”该执行什么命令?

```
: set nu
```

2、“删除光标所在行”该如何按下键盘?

dd

3、“复制当前光标所在行一下3行”该如何按下键盘?

3yy

4、“在当前光标所在行粘贴上一个命令所复制的3行”改如何按下键盘?

3p

5、“将第10行至第21行的字符old替换为字符new”该执行什么命令?

```
: 10,21s/old/new/g 
```

6、“将文档保存并退出”该执行什么命令?

```
:wq
```

## 软件包管理

1、rpm –qf /bin/ls的功能是什么?


2、mv /bin/ls /tmp/的功能是什么?


3、rpm2cpio /mnt/cdrom/Packages/coreutils-8.4-19.el6.i686.rpm|cpio -idv ./bin/ls 的功能是什么?


4、cp /root/bin/ls /bin/的功能是什么?


5、yum list的功能是什么?


6、yum search httpd的功能是什么?


7、yum -y install httpd的功能是什么?


8、yum -y remove httpd的功能是什么?


9、mount –t is9660 /dev/sr0 /mnt/cdrom的功能是什么? 10、/etc/fstab这个文件的作用是什么?


11、./configure --prefix=/usr/local/apache2的功能是什么?


12、make的功能是什么?


13、make install的功能是什么?


14、/usr/local/apache2/bin/apachectl start的功能是什么?


## 用户和用户组管理

1、/etc/passwd该文件的结构如何构成和它作用是什么?

2、/etc/shadow该文件的作用是什么?

3、/etc/group该文件的作用是什么?

4、/etc/gshadow该文件的作用是什么?

5、什么是初始组和附加组?

6、/sbin/nologin该文件的作用是什么?

7、date -d "1970-01-01 17003 days"的功能是什么?

8、echo $(($(date --date="2015/07/23" +%s)/86400+1))的功能是什么?

9、/etc/skel/这个目录的功能是什么?

10、 - - - \-       -   该命令的功能是什么?

11、/etc/login.defs该文件的功能是什么?


12、passwd -l lisi该命令的功能是什么?


13、passwd -u lisi该命令的功能是什么?


14、echo "321" | passwd --stdin lisi改命令的功能是什么?

15、usermod -c "test user" lisi该命令的功能是什么?

16、usermod -G root lisi 该命令的功能是什么?

17、usermod -L lisi该命令的功能是什么?

18、usermod -U lisi该命令的功能是什么?

19、chage -d 0 lisi该命令的功能是什么?

20、userdel -r lisi该命令的功能是什么?

21 、id lisi该命令的功能是什么?


22、su - lisi该命令的功能是什么?


23、groupadd tg该命令的功能是什么?


24、groupmod -n newgroup oldgroup该命令的功能是什么?

25、groupdel lisi该命令的功能是什么?


26、useradd -g initialgroup user01该命令的功能是什么?

27、useradd -G additiongroup user02该命令的功能是什么?

28、如果初始组里面有个用户还没有删除，这个初始组能被删除吗?

29、gpasswd -a lisi anothergroup该命令的功能是什么?

30、gpasswd -d lisi anothergroup该命令的功能是什么?

31、useradd -d /home/lisi -s /bin/bash该命令的功能是什么?

        useradd
u 888
G root,bin
d /home/xyz
 c "test user"
s /bin/bash user03


##权限管理

1、dumpe2fs -h /dev/sda2| grep acl该命令的功能是什么?

2、mount -o remount,acl /该命令的功能是什么?

3、getfacl /dev/sda2该命令的功能是什么?

4、chown root:tgroup /project/该命令的功能是什么?

5、chmod 770 /project/该命令的功能是什么?

6、setfacl -m u:st:rx /project/该命令的功能是什么?

7、setfacl -m g:tgroup2:rwx /project/该命令的功能是什么?

8、setfacl -m m:rx /project/该命令的功能是什么?

9、setfacl -x u:st /project/该命令的功能是什么?

10、setfacl -x g:tgroup2 /project/该命令的功能是什么?

11、setfacl -b /project/该命令的功能是什么?

12、setfacl –m u:st:r-x –R /project该命令的功能是什么?

13、setfacl –m d:u:st:r-x –R /project该命令的功能是什么?

14、为什么要ACL权限?

15、chmod 4755 abc该命令的功能是什么?

16、/etc/passwd的文件权限是?为什么普通用户还可以设置密码?

17、SetUID的功能是什么?是针对目录还是文件?(提醒:奥特曼变身)

18、如何取消SetUID权限?

19、-rwSr--r--改权限中的大写的S表示什么意思?(提醒:x权限)

20、chmod 4755 /usr/bin/vim该命令的功能是什么?会产生什么影响?

21、/usr/bin/locate命令是否具有SetGID功能?

22、SetGID的功能是什么?是针对目录还是文件?

23、chmod 2755 xyz该命令的功能是什么?

24、用户lisi在/tmp建立的文件，文件的拥有者和用户组分别是谁?

25、Sticky Bit的功能是什么?是针对目录还是文件?

26、用户lisi在/tmp建立的文件，用户张三可以删除吗?

27、chmod o-t /test/该命令的功能是什么?

28、chattr +i xyz命令操作后，用户能对文件xyz进行删除、改名或修改数据吗?(提醒:记 事本)

29、chattr +a xyz命令操作后，用户能对文件xyz进行删除数据、修改数据或增加数据吗?如 果xyz是目录呢，能在这个目录创建文件、修改文件或删除文件吗?

30、如何取消28、29问题增加的i、a属性?

31、lsattr -a xyz该命令的功能是什么?

32、把本来只能超级用户执行的命令赋予普通用户执行，用什么命令?

33、/etc/sudoers该文件的功能是什么?


34、通过visudo在第100行添加“lisi 192.168.123.11=(ALL) /usr/bin/vim”这样一行 的功能是什么?


## 文件系统管理

1、df -h该命令的功能是什么?


2、du -sh /etc/该命令的功能是什么?


3、mount -a该命令的功能是什么?


4、mount -o remount,noexec /home/该命令的功能是什么?(提醒:该命令不能随便执 行，否则要进入单用户维护模式进行修复)


5、umount /mnt/cdrom该命令的功能是什么


6、fdisk -l该命令的功能是什么?


7、mount –t vfat /dev/sdb1 /mnt/usb/该命令的功能是什么?


8、mount -t ntfs-3g /dev/sdb2 /mnt/ntfs该命令的功能是什么?


9、fdisk /dev/sdb该命令的功能是什么? 10、partprobe该命令的功能是什么?(提醒:跟内核有关)


11、mkfs -t ext4 /dev/sdb1该命令的功能是什么?


12、free -m该命令的功能是什么?

13、什么是缓存(cached)?什么是缓冲(buffer)?

14、swap分区的功能是什么?它的类型是82吗?


15、mkswap /dev/sdb6该命令的功能是什么?


16、swapon /dev/sdb6该命令的功能是什么?


17、swapoff /dev/sdb6该命令的功能是什么?


## Shell基础

1、CentOS6.4默认使用的Shell是什么?

2、echo -e "\e[1;31m abcd\e[0m“该命令的功能是什么?

3、#!/bin/bash该串字符在Shell编程中的含义是?


4、cat –A hello.sh该命令的功能是什么?


5、dos2unix abc该命令的功能是什么?


6、history -c该命令的功能是什么?


7、history -w该命令的功能是什么?


8、如何修改存储历史命令数目大小?

9、如何给vim设定命令别名为vi?(提醒:两种方式，用命令或修改环境配置文件)

10、如何取消别名?


11、date > a该命令的功能是什么?


12、date >> a该命令的功能是什么?


13、ls &>/dev/null 该命令的功能是什么?


14、ls >> def 2>>efg 该命令的功能是什么?


15、wc -l 该命令的功能是什么?


16、ls;date;cd /user/;pwd该命令中分号的作用是什么?


17、date;dd if=/dev/zero of=/root/testfile bs=1k count=100000;date该命令的功能是什么?


18、ls && echo yes || echo no该命令的功能是什么?


19、netstat -an | grep "ESTABLISHED"该命令的功能是什么?

20、管道符号的功能是什么?


21、grep "root" /etc/passwd该命令的功能是什么?


22、grep -n --color=auto "root" /etc/passwd该命令的功能是什么?

23、通配符中?、*、[]、[-]、[^]的作用分别是什么?

24、特殊符号``(反引号)、$()、\、“”(双引号)、‘’(单引号)、#、$的作用分别是什么?

25、变量名称可以由字母，数字和下划线组成，但是不能以数字开头，对吗?

26、请问用户自动定义变量、环境变量、位置参数变量、预定义变量的作用是什么?

27、set该命令的功能是什么?


28、unset name该命令的功能是什么?


29、export age=18该命令的功能是什么?


30、env该命令的功能是什么?


31、echo $PATH该命令的功能是什么?


32、PS1变量的功能是什么?

33、$0、$?、$1、$*、$@、$#、$$、$!位置参数变量的作用是什么?


34、read -t 30 -p "Please input your name:" name该语句的功能是什么?

35、aa=11;bb=22;declare -i cc=$aa+$bb该命令的功能是什么?


36、declare -p aa该命令的功能是什么?


37、dd=$(expr $aa + $bb)该命令的功能是什么?(提醒:+号两边有空格)


38、source /etc/profile该命令的功能是什么?

39、请说明/etc/profile、/etc/profile.d/*.sh、~/.bash_profile、~/.bashrc和/etc/bashrc 这几个文件的关系和作用是怎样的?(提醒:可以用图示说明。)

40、/etc/issue、/etc/motd和/etc/issue.net这几个文件的作用是什么?

## Shell 编程

1、正则表达式是用来在文件中匹配符合条件的字符串，正则是包含匹配吗？

2、通配符是用来在文件中匹配符合条件的字符串，通配符是完全匹配吗?

3、常用的shell编程四剑客是指find、grep、awk(配合printf)和sed吗?

4、正则表达式中元字符*、.、^、$、[]、[^]、\、\{n}、\{n,\}、\{n,m\}的作用分别是什么?

5、grep "a*" test_rules.txt 该命令的功能是什么?


6、grep "aaa*" test_rules.txt 该命令的功能是什么?

7、grep "s..d" test_rules.txt 该命令的功能是什么?

8、grep "^M" test_rules.txt 该命令的功能是什么?

9、grep "n$" test_rules.txt 该命令的功能是什么?

10、grep -n "^$" test_rules.txt 该命令的功能是什么?

11、grep "s[ao]id" test_rules.txt该命令的功能是什么?

12、grep "[0-9]" test_rules.txt 该命令的功能是什么?

13、grep "^[a-z]" test_rules.txt 该命令的功能是什么?

14、grep "^[^0-9]" test_rules.txt 该命令的功能是什么?

15、grep "^[^a-z]" test_rules.txt 该命令的功能是什么?

16、grep "^[^a-zA-Z]" test_rules.txt 该命令的功能是什么?

17、grep "\.$" test_rules.txt 该命令的功能是什么?


18、grep “a\{3\}" test_rules.txt 该命令的功能是什么?

19、grep "[0-9]\{3\}" test_rules.txt 该命令的功能是什么?

20、grep "^[0-9]\{3,\}[a-z]" test_rules.txt该命令的功能是什么?

21、grep "sa\{1,3\}i" test_rules.txt该命令的功能是什么?


22、cut -f 2 student.txt 该命令的功能是什么?

23、cut -f 2,4 student.txt该命令的功能是什么?


24、cut -d ":" -f 1,3 /etc/passwd该命令的功能是什么?


25、df -h | grep "sda2" |cut -d " " -f 5该命令的局限是什么?


26、printf %s 1 2 3 4 5 6该命令的功能是什么?


27、printf %s %s %s 1 2 3 4 5 6 该命令的功能是什么?


28、printf '%s %s %s' 1 2 3 4 5 6该命令的功能是什么?


29、printf ‘%s %s %s\n’ 1 2 3 4 5 6该命令的功能是什么?


30、printf '%s' $(cat student2.txt)该命令的功能是什么?


31、printf '%s\t %s\t %s\t %s\t %s\t %s\n' $(cat student2.txt)该命令的功能是什么?

32、print命令与printf命令有什么不同?


33、df -h |awk '{print $1 "\t" $3}'该命令的功能是什么?


34、awk '{printf $2 "\t" $6 "\n"}' student2.txt 该命令的功能是什么?


35、awk 'BEGIN{printf "This is a transcript \n"}{printf $2 "\t" $6 "\n"}' student2.txt该命 令的功能是什么?


36、cat /etc/passwd | grep "/bin/bash" |awk 'BEGIN{FS=":"}{printf $1 "\t" $3 "\n"}‘该 命令的功能是什么?


37、awk 'END{printf "The End\n"}{printf $2 "\t" $6 "\n"}' stu2.txt 该命令的功能是什么?

38、cat stu2.txt |grep -v Name | awk '$6>=87 {printf $2 "\n"}'该命令的功能是什么?

39、sed '2p' student2.txt '该命令的功能是什么?


40、sed -n '2p' student2.txt '该命令的功能是什么?


41、df -h |sed -n "2p" '该命令的功能是什么?


42、sed -n '2,4p' student2.txt '该命令的功能是什么?


43、sed '2,4d' student2.txt '该命令的功能是什么?


44、sed '2a hello' student2.txt'该命令的功能是什么?


45、sed '2i cao \zhao' student2.txt'该命令的功能是什么?


46、sed '2c No such person' student2.txt'该命令的功能是什么?


47、sed '3s/74/99/g' student2.txt该命令的功能是什么?


48、sed -i '3s/74/99/g' student2.txt该命令的功能是什么?


49、sed -e 's/Lisi//g;s/Wangwu//g' student2.txt 该命令的功能是什么? (提醒:22~49的就是Shell编程其中三剑客了。)


50、sort /etc/passwd该命令的功能是什么?


51、sort -r /etc/passwd该命令的功能是什么?


52、sort -t ":" -k 3,3 /etc/passwd该命令的功能是什么?


53、sort -n -t ":" -k 3,3 /etc/passwd该命令的功能是什么?


54、wc -l /etc/passwd该命令的功能是什么?


55、test -e /root/install.log该命令的功能是什么?


56、[ -e /root/install.log ]该命令的功能是什么?


57、[ -d /root ] && echo "yes" || echo "no"该命令的功能是什么?


58、[ -w /root/student2.txt ] && echo yes || echo no该命令的功能是什么?


59、[ /root/student2.txt -ef /tmp/stu.txt ] && echo yes || echo no该命令的功能是什么?


60、[ 23 -gt 24 ] && echo yes || echo no该命令的功能是什么?


61、[ -z "$name" ] && echo yes || echo no该命令的功能是什么?


62、[ "$aa" == "bb" ]&& echo yes || echo no 该命令的功能是什么?


63、[ -n "$aa" -a "$aa" -gt 23 ] && echo yes || echo no该命令的功能是什么?


