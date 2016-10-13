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

查询ls命令属于哪个软件包

2、mv /bin/ls /tmp/的功能是什么?

造成ls命令误删除假象

3、rpm2cpio /mnt/cdrom/Packages/coreutils-8.4-19.el6.i686.rpm|cpio -idv ./bin/ls 的功能是什么?

提取RPM包中ls命令到当前目录的/bin/ls下 

4、cp /root/bin/ls /bin/的功能是什么?

把ls命令复制至/bin目录，修复丢失文件 

5、yum list的功能是什么?

查询所有可用软件包列表

6、yum search httpd的功能是什么?

搜索服务器上所有和关键字httpd相关的包 

7、yum -y install httpd的功能是什么?

安装httpd，自动回答yes

8、yum -y remove httpd的功能是什么?

删除httpd，自动回答yes

9、mount –t is9660 /dev/sr0 /mnt/cdrom的功能是什么?

> **mount**
> The mount command calls the mount(2) system call to prepare and graft a special device or the remote node (rhost:path) on to the file system tree at the point mount_point, which must be a directory.
> If either special or mount_point are not provided, the appropriate information is obtained via the getfsent(3) library routines.

挂在光盘

10、/etc/fstab这个文件的作用是什么?

存放文件系统的静态信息的文件

11、./configure --prefix=/usr/local/apache2的功能是什么?

检测安装平台的目标特征&设置默认安装路径

12、make的功能是什么?

make是一个工具程序（Utility software），经由读取叫做“makefile”的文件，自动化建构软件。它是一种转化文件形式的工具，转换的目标称为“target”；与此同时，它也检查文件的依赖关系，如果需要的话，它会调用一些外部软件来完成任务。它的依赖关系检查系统非常简单，主要根据依赖文件的修改时间进行判断。大多数情况下，它被用来编译源代码，生成结果代码，然后把结果代码连接起来生成可执行文件或者库文件。它使用叫做“makefile”的文件来确定一个target文件的依赖关系，然后把生成这个target的相关命令传给shell去执行。

13、make install的功能是什么?

用来安装的，它也从Makefile中读取指令，安装到指定的位置。

14、/usr/local/apache2/bin/apachectl start的功能是什么?

启动 apache 服务器

## 用户和用户组管理

1、/etc/passwd该文件的结构如何构成和它作用是什么?
**字段1:用户名称**
**字段2:密码标志----/etc/shadow**

- /etc/passwd的权限为644
- x表示设置了密码，存放在/etc/shadow(权限000) 
- 加密:SHA,512位 

**字段3:UID(用户ID)**

- 0 超级用户1-499 系统用户(伪用户)
- 500-65535 普通用户(2^32) 

**字段4:GID(用户初始组)**
**字段5:用户说明**
**字段6:家目录(初始登录位置)**

- 普通用户:/home/用户名/
- 超级用户:/root/ 

**字段7:登录之后的Shell**

记录用户信息

2、/etc/shadow该文件的作用是什么?

**字段1:用户名**
**字段2:加密密码**

- 加密算法升级为SHA512散列加密算法
- 有可能被暴力破解
- 如果密码位是!!或*代表没有密码，不能登录 

**字段3:密码最后一次修改日期** 

- 使用1970年1月1日作为标准时间，每过一天时 间戳加1 

**字段4:两次密码的修改间隔时间(和第3 字段相比)**
**字段5:密码有效期(和第3字段相比)**
**字段6:密码修改到期前的警告天数(和第 5字段相比)**
**字段7:密码过期后的宽限天数(和第5字 段相比)** 

- 0:代表密码过期后立即失效，跟不写一样
- -1:则代表密码永远不会失效 

**字段8:账号失效时间**

- 要用时间戳表示 

**字段9:保留**

3、/etc/group该文件的作用是什么?

用户组的所有信息都存放在/etc/group文件中

4、/etc/gshadow该文件的作用是什么?

为了加强组口令的安全性，防止黑客对其实行的暴力攻击，而采用的一种将组口令与组的其他信息相分离的安全机制。

5、什么是初始组和附加组?

**初始组** 

- 用户一登录就立刻拥有这个用户组的相关权限，每个用户的初始组只能有一个，一般就是和这个用户的用户名相同的组名作为这个用户的初始组。(不建议更改初始组)

**附加组**
 
- 用户可以加入多个其他的用户组，并拥有这些组的权限，附加组可以有多个。 


6、/sbin/nologin该文件的作用是什么?

有一个shell可以用来替代让账号无法登陆的命令

7、date -d "1970-01-01 17003 days"的功能是什么?

把时间戳换算为日期

8、echo $(($(date --date="2015/07/23" +%s)/86400+1))的功能是什么?

把日期换算为时间戳

9、/etc/skel/这个目录的功能是什么?

skel 是 skeleton 的缩写,每当新建一个用户的时候 (通过 useradd 命令),/etc/skel 目录下的文件,都会原封不动的复制到新建用户的家目录下

10、useradd -u 888 -G root,bin -d /home/xyz \ -c "test user" -s /bin/bash haha 该命令的功能是什么?

指定选项添加用户 

11、/etc/login.defs该文件的功能是什么?

设置用户帐号限制的文件
12、passwd -l lisi该命令的功能是什么?

暂时锁定用户，仅root用户可用

13、passwd -u lisi该命令的功能是什么?

解锁用户。仅root用户可用

14、echo "321" | passwd --stdin lisi改命令的功能是什么?

使用字符串作为用户的密码 

15、usermod -c "test user" lisi该命令的功能是什么?

修改用户说明

16、usermod -G root lisi 该命令的功能是什么?

把lisi用户加入root组 

17、usermod -L lisi该命令的功能是什么?

锁定用户 

18、usermod -U lisi该命令的功能是什么?

解锁用户 

19、chage -d 0 lisi该命令的功能是什么?

- 把密码修改日期归0(shadow字段3)
- 用户一登录就要修改密码 

20、userdel -r lisi该命令的功能是什么?

删除用户的同时删除用户家目录 

21 、id lisi该命令的功能是什么?

查看用户ID 

22、su - lisi该命令的功能是什么?

选项只使用“-”，代表连带用户的环境 变量一起切换 

23、groupadd tg该命令的功能是什么?

新建一个组tg 

24、groupmod -n newgroup oldgroup该命令的功能是什么?

将oldgroup更名为newgroup 

25、groupdel lisi该命令的功能是什么?

删除用户组 

26、useradd -g initialgroup user01该命令的功能是什么?

添加用户user01，手工指定用户的初始组 initialgroup

27、useradd -G additiongroup user02该命令的功能是什么?

添加用户user02，指定用户的附加组 additiongroup

28、如果初始组里面有个用户还没有删除，这个初始组能被删除吗?

不能删除初始用户组 

29、gpasswd -a lisi anothergroup该命令的功能是什么?

把用户lisi加入组anothergroup(成为附加组) 

30、gpasswd -d lisi anothergroup该命令的功能是什么?

把用户lisi从组anothergroup中删除 

31、useradd -d /home/lisi -s /bin/bash该命令的功能是什么?

创建用户
手工指定用户的家目录 
手工指定登录shell 



##权限管理

1、dumpe2fs -h /dev/sda2| grep acl该命令的功能是什么?

查询指定分区详细文件系统信息的命令 
仅显示超级块中信息 
搜索并打印出包含acl的行
查看分区ACL权限是否开启 

2、mount -o remount,acl /该命令的功能是什么?

重新挂载根分区，并挂载加入acl权限 

3、getfacl /dev/sda2该命令的功能是什么?

查看/dev/sda2 acl权限 

4、chown root:tgroup /project/该命令的功能是什么?

改变 /project/ 拥有者为root，拥有群组为tgroup

5、chmod 770 /project/该命令的功能是什么?

对 /project/ 设置为所属用户、所属群组拥有可读可写可执行权限，其他用户不具备任何权限

6、setfacl -m u:st:rx /project/该命令的功能是什么?

给用户st赋予r-x权限，使用“u:用户名:权限”格式 

7、setfacl -m g:tgroup2:rwx /project/该命令的功能是什么?

为组tgroup2分配ACL权限。使用“g:组名:权限”格式 

8、setfacl -m m:rx /project/该命令的功能是什么?

设定mask权限为r-x。使用“m:权限”格式 

9、setfacl -x u:st /project/该命令的功能是什么?

删除指定用户的ACL权限 

10、setfacl -x g:tgroup2 /project/该命令的功能是什么?

删除指定用户组的ACL权限 

11、setfacl -b /project/该命令的功能是什么?

删除文件所有的ACL权限 

12、setfacl –m u:st:r-x –R /project该命令的功能是什么?

给用户st赋予r-x权限，使用“u:用户名:权限”格式
并且递归所有的子文件和 子目录也会拥有相同的ACL权限。 

13、setfacl –m d:u:st:r-x –R /project该命令的功能是什么?

如果给父目录设定了 默认ACL权限，那么父目录中所有新建的子 文件都会继承父目录的ACL权限。 

14、为什么要ACL权限?

ACL 权限控制主要目的是提供传统的 owner,group,other 的read,wirte,execute 权限之外的具体权限设置，可以针对单一用户或组来设置特定的权限

15、chmod 4755 abc该命令的功能是什么?

设定SetUID

16、/etc/passwd的文件权限是?为什么普通用户还可以设置密码?

/etc/passwd仅有root权限的写（w）权
可实际上每个用户都可以通过/usr/bin/passwd命令去修改这个文件

于是这里就涉及了linux里的特殊权限setuid，正如-rwsr-xr-x中的s setuid就是：让普通用户拥有可以执行“只有root权限才能执行”的特殊权限

17、SetUID的功能是什么?是针对目录还是文件?(提醒:奥特曼变身)

- 只有可执行的二进制程序才能设定SetUID权限
- 命令执行者要对该程序拥有x(执行)权限 
- 命令执行者在执行该程序时获得该程序文件属主的身份(在执行程序的过程中灵魂附体为文件的属主)，命令属主还是原拥有者，借了这个身份。 
- SetUID权限只在该程序执行过程中有效，也就 是说身份改变只在程序执行过程中有效。 

18、如何取消SetUID权限?

- chmod 755 文件名
- chmod u-s 文件名 

19、-rwSr--r--改权限中的大写的S表示什么意思?(提醒:x权限)

SetUID

20、chmod 4755 /usr/bin/vim该命令的功能是什么?会产生什么影响?

设定SetUID

21、/usr/bin/locate命令是否具有SetGID功能?

具有

22、SetGID的功能是什么?是针对目录还是文件?

- 有执行权限的目录和文件才能设置SGID权限
- 命令执行者要对该对象拥有x(执行)权限 
- 命令执行在执行程序的时候，组身份升级为该程序文件的属性 
- SetGID权限同样只在该程序执行过程中有效，也就是说组身份改变只在程序执行过程中有效 

23、chmod 2755 xyz该命令的功能是什么?

设定SetGID 

24、用户lisi在/tmp建立的文件，文件的拥有者和用户组分别是谁?

都是 root

25、Sticky Bit的功能是什么?是针对目录还是文件?

- 粘着位目前只对目录有效
- 普通用户对该目录拥有w和x权限，及普通用户可以在此目录拥有写入权限
- 如果没有粘着位，因为普通用户拥有w权限，所以可以删除此目录下所有文件，包括其他用户建立的文件。一旦赋予了粘着位，除了root可以删除所有文件，普通用户就算 拥有w权限，也只能删除自己建立的文件， 但是不能删除其他用户建立的文件。 

26、用户lisi在/tmp建立的文件，用户张三可以删除吗?

可以

27、chmod o-t /test/该命令的功能是什么?

取消粘着位 

28、chattr +i xyz命令操作后，用户能对文件xyz进行删除、改名或修改数据吗?(提醒:记事本)

如果对文件设置i属性，那么不允许对文件进行删除、改名，也不能添加和修改数据(锁死 啦);如果对目录设置i属性，那么只能修改目录下文件的数据，但不允许建立和删除文件。 

29、chattr +a xyz命令操作后，用户能对文件xyz进行删除数据、修改数据或增加数据吗?如 果xyz是目录呢，能在这个目录创建文件、修改文件或删除文件吗?

如对文件设置a属性，那么只能在文件中增加数据，但是不能删除也不能修改数据(锁死 已有数据);如果对目录设置a属性，那么只允许在目录中建立和修改文件，但不允许删除。

30、如何取消28、29问题增加的i、a属性?

chattr -i xyz
chattr -a xyz

31、lsattr -a xyz该命令的功能是什么?

显示所有文件和目录 

32、把本来只能超级用户执行的命令赋予普通用户执行，用什么命令?

sudo

33、/etc/sudoers该文件的功能是什么?

sudo的主要配置文件

34、通过visudo在第100行添加“lisi 192.168.123.11=(ALL) /usr/bin/vim”这样一行的功能是什么?

表示允许lisi用户从主机192.168.123.11登录，以root的身份执行/usr/bin/vim命令。

## 文件系统管理

1、df -h该命令的功能是什么?

使用习惯单位显示容量，如KB，MB或GB等 

2、du -sh /etc/该命令的功能是什么?

统计总占用量，而不列出子目录和子文件的占用量并且使用习惯单位显示磁盘占用量，如KB、 MB或GB等 

3、mount -a该命令的功能是什么?

依据配置文件/etc/fstab的内容，自动挂载 

4、mount -o remount,noexec /home/该命令的功能是什么?(提醒:该命令不能随便执行，否则要进入单用户维护模式进行修复)

禁止/home执行可执行文件 

5、umount /mnt/cdrom该命令的功能是什么

卸载 /mnt/cdrom

6、fdisk -l该命令的功能是什么?

查看系统中挂载的U盘

7、mount –t vfat /dev/sdb1 /mnt/usb/该命令的功能是什么?

查看U盘设备文件名,U盘是自动识别的，vfat表示FAT32 

8、mount -t ntfs-3g /dev/sdb2 /mnt/ntfs该命令的功能是什么?

挂载

9、fdisk /dev/sdb该命令的功能是什么?

使用fdisk命令分区 

10、partprobe该命令的功能是什么?(提醒:跟内核有关)

重新读取分区表信息 

11、mkfs -t ext4 /dev/sdb1该命令的功能是什么?

格式化分区 

12、free -m该命令的功能是什么?

查看内存与swap分区使用情况 

13、什么是缓存(cached)?什么是缓冲(buffer)?

- cached(缓存):是指把读取出来的数据保存 在内存当中，当再次读取时，不用读取硬盘而直接从内存当中读取，加速了数据的读取过程

- buffer(缓冲):是指在写入数据时，先把分散的写入操作保存到内存当中，当达到一定程度再集中写入硬盘，减少了磁盘碎片和磁盘的反复寻道，加速了数据的写入过程。

14、swap分区的功能是什么?它的类型是82吗?

当内存不足的时候，把一部分硬盘空间虚拟成内存使用,从而解决内存容量不足的情况。
它的类型是82。

15、mkswap /dev/sdb6该命令的功能是什么?

格式化 

16、swapon /dev/sdb6该命令的功能是什么?

加入swap分区 

17、swapoff /dev/sdb6该命令的功能是什么?

删除swap分区 

## Shell基础

1、CentOS6.4默认使用的Shell是什么?

Bash

2、echo -e "\e[1;31m abcd\e[0m“该命令的功能是什么?

输出红颜色

3、#!/bin/bash该串字符在Shell编程中的含义是?

 #!行是必要的，用于告诉系统，用那个程序来解析其下的所有行的代码。

4、cat –A hello.sh该命令的功能是什么?

打印文件 hello.sh

- 使用 ^ 和 M- 引用，除了 LFD 和 TAB 之外
- 在每行结束处显示 $
- 将跳格字符显示为 ^I

5、dos2unix abc该命令的功能是什么?

将DOS格式文本文件abc转换成Unix格式

6、history -c该命令的功能是什么?

清除历史命令(建议不要清除) 

7、history -w该命令的功能是什么?

把缓存中的历史命令写入历史命令保存 文件~/.bash_history 

8、如何修改存储历史命令数目大小?

- 历史命令默认会保存1000条，可以在环境 变量配置文件/etc/profile中进行修改。 
- 48行 HISTSIZE=1000
- 改动后，需要重启才生效 

9、如何给vim设定命令别名为vi?(提醒:两种方式，用命令或修改环境配置文件)

alias vim='vi'

vi /root/.bashrc

10、如何取消别名?

unalias 别名

11、date > a该命令的功能是什么?

以覆盖的方式，把命令正确输出输出到指定的文件或设备当中。

12、date >> a该命令的功能是什么?

以追加的方式，把命令正确输出输出到指定的文件或设备当中

13、ls &>/dev/null 该命令的功能是什么?

- 将没有意义的输出丢到垃圾箱(黑洞)
- 有些输出是不需要的时候，就丢弃 

14、ls >> def 2>>efg 该命令的功能是什么?

将正确输出保存到文件def中，错误输出保存到文件efg中

15、wc -l 该命令的功能是什么?

统计行数 

16、ls;date;cd /user/;pwd该命令中分号的作用是什么?

多个命令顺序执行，命令之间没有任何逻辑联系

17、date;dd if=/dev/zero of=/root/testfile bs=1k count=100000;date该命令的功能是什么?

创建100M的文件需要多长时间 

18、ls && echo yes || echo no该命令的功能是什么?

判断命令执行是否出错 

19、netstat -an | grep "ESTABLISHED"该命令的功能是什么?

查看本机所有的网络连接中包含ESTABLISHED的连接

20、管道符号的功能是什么?

把第一个命令command 1执行的结果作为command2的输入传给command 2

21、grep "root" /etc/passwd该命令的功能是什么?

将/etc/passwd，有出现 root 的行取出来

22、grep -n --color=auto "root" /etc/passwd该命令的功能是什么?

将/etc/passwd，有出现 root 的行取出来
显示匹配行及行号
关键字设置为红色

23、通配符中?、*、[]、[-]、[^]的作用分别是什么?

? 匹配一个任意字符 
* 匹配0个或多个任意字符 
[] 匹配中括号中任意一个字符。例如，[abc]代表一定匹配一个字符，或者是a，或者是b，或者是c 
[-] 匹配中括号中任意一个字符，-代表一个范围。例如，[a-z]代表匹配一个小写字母。 
[^] 逻辑非，表示匹配不在中括号内的一个字符。例如，[^0-9]代表匹配一个不是数字的字符 

24、特殊符号``(反引号)、\$()、\、“”(双引号)、‘’(单引号)、#、$的作用分别是什么?

'' 单引号。在单引号中所有的特殊符号，如“$”和“`”(反引号)没有特殊含义。 
"" 双引号。在双引号中特殊符号都没有特殊含义，但是“$”和“\”是例 外，拥有“调用变量的值”、“引用命令”、和“转符”的特殊含义。 
`` 反引号。反引号扣起来的内容是系统命令，在bash中会先执行和$()作用 一样，不过推荐使用$()，因为反引号非常容易看错。 
$() 用来引用系统命令，和反引号一样。
 # 在Shell脚本中，#开头的行代表注释。 
$ 用于调用变量的值，如需要调用变量name的值时，需要用$name的方 式得到标量的值。 
\ 转义符。跟在\之后的特殊符号将失去特殊含义，变为普通字符如\$将 输出“$”符号，而不当做是变量引用。 

25、变量名称可以由字母，数字和下划线组成，但是不能以数字开头，对吗?

对

26、请问用户自动定义变量、环境变量、位置参数变量、预定义变量的作用是什么?

**用户自定义变量**

**环境变量** 

- 这种变量主要保存的是和操作系统操作环境相关的数据 

**位置参数变量**

- 这种变量主要是用来向脚本当中传递参数或数据的，变量名不能自定义，变量作用是固定的。

**预定义变量**

- 是Bash中已经定义好的变量，变量名不能自定义，变量作用也是固定的。 


27、set该命令的功能是什么?

变量查看

28、unset name该命令的功能是什么?

变量删除

29、export age=18该命令的功能是什么?

声明变量，export就是环境变量的标志 

30、env该命令的功能是什么?

查询变量

31、echo $PATH该命令的功能是什么?

系统查找命令的路径 

32、PS1变量的功能是什么?

定义系统提示符的变量 

33、$0、$?、$1、$*、$@、$#、$$、$!位置参数变量的作用是什么?

$? 最后一次执行的命令的返回状态。如果这个变量的值 为0，证明上一个命令正确执行;如果这个变量的值为 非0(具体是哪个数，由命令自己来决定)，则证明上 一个命令执行不正确了。 可以联想&&逻辑与和||逻辑或 
$$ 当前进程的进程号(PID) 
$! 后台运行的最后一个进程的进程号(PID) 
$n n为数字，$0代表命令本身，$1-$9代表第一到第九个 参数，十以上的参数需要用大括号包含，如${10} 
$* 这个变量代表命令行中所有的参数，$*把所有的参数 看成一个整体。 
$@ 这个变量也代表命令行中所有的参数，不过$@把每个 参数区分对待 
$# 这个变量代表命令行中所有参数的个数

34、read -t 30 -p "Please input your name:" name该语句的功能是什么?

提示"请输入姓名"并等待30秒，把用户的输入保存入变量name中 

35、aa=11;bb=22;declare -i cc=$aa+$bb该命令的功能是什么?

给变量aa和bb赋值，将变量声明为整数型 

36、declare -p aa该命令的功能是什么?

显示指定变量的被声明的类型 

37、dd=$(expr $aa + $bb)该命令的功能是什么?(提醒:+号两边有空格)

dd的值是aa和bb的和。 

38、source /etc/profile该命令的功能是什么?

source命令通常用于重新执行刚修改的初始化文件，使之立即生效，而不必注销并重新登录。

39、请说明/etc/profile、/etc/profile.d/*.sh、~/.bash_profile、~/.bashrc和/etc/bashrc 这几个文件的关系和作用是怎样的?(提醒:可以用图示说明。)


40、/etc/issue、/etc/motd和/etc/issue.net这几个文件的作用是什么?

## Shell 编程

1、正则表达式是用来在文件中匹配符合条件的字符串，正则是包含匹配吗？

正则表达式用来在文件中匹配符合条件的字符串，正则是包含匹配。grep、awk、sed 等命令可以支持正则表达式。 

2、通配符是用来在文件中匹配符合条件的字符串，通配符是完全匹配吗?

通配符在系统中用来匹配符合条件的文件名，通配符是完全匹配。 

3、常用的shell编程四剑客是指find、grep、awk(配合printf)和sed吗?

是

4、正则表达式中元字符*、.、^、$、[]、[^]、\、\{n}、\{n,\}、\{n,m\}的作用分别是什么?

* 前一个字符匹配0次或任意多次。 
. 匹配除了换行符以外任意一个字符。相当于通配符?
^ 匹配行首。如，^hello会匹配以hello开头的行。 
$ 匹配行尾。如，hello$会匹配以hello结尾的行。 
[] 匹配中括号指定的任意一个字符，只匹配一个字符。 如，[aeiou]匹配任意一个元音字母，[0-9]匹配任意以为数字， [a-z][0-9]匹配小写字母和一位数字构成的两位字符。相当于通配符[] 
[^] 匹配出中括号的字符以外的任意一个字符。如，[^0-9]匹配任意一位非 数字字符，[^a-z]表示任意一位非小写字母。 
\ 转义符。用于取消特殊符号的含义。
\{n} 表示其前面的字符恰好出现n次。如，[0-9]\{4\}匹配4位数字， [1][3-8][0-9]\{9\}匹配手机号码 
\{n,\} 表示前面的字符出现不小于n次。如，[0-9]\{2,\}表示两位及以上的数字。 
\{n,m\} 表示前面的字符至少出现n次，最多出现m次。如[a-z]\{6,8\}匹配6到8位 的小写字母。 

5、grep "a*" test_rules.txt 该命令的功能是什么?

匹配所有内容，包括空白行

6、grep "aaa*" test_rules.txt 该命令的功能是什么?

匹配至少包含有两个连续a的字符串 

7、grep "s..d" test_rules.txt 该命令的功能是什么?

匹配在s和d这两个字母之间一定有两个字符的单词 

8、grep "^M" test_rules.txt 该命令的功能是什么?

匹配以大写“M”开头的行 

9、grep "n$" test_rules.txt 该命令的功能是什么?

匹配以小写“n”结尾的行

10、grep -n "^$" test_rules.txt 该命令的功能是什么?

匹配空白行，并显示行号 

11、grep "s[ao]id" test_rules.txt该命令的功能是什么?

匹配s和i字母中，要不是a，要不是o 

12、grep "[0-9]" test_rules.txt 该命令的功能是什么?

匹配任意一个数字 

13、grep "^[a-z]" test_rules.txt 该命令的功能是什么?

匹配用小写字母开头的行 

14、grep "^[^0-9]" test_rules.txt 该命令的功能是什么?

匹配不含数字开头的行 

15、grep "^[^a-z]" test_rules.txt 该命令的功能是什么?

匹配不是小写字母开头的行

16、grep "^[^a-zA-Z]" test_rules.txt 该命令的功能是什么?

匹配不是字母开头的行 

17、grep "\.$" test_rules.txt 该命令的功能是什么?

匹配使用“.”结尾的行 

18、grep “a\{3\}" test_rules.txt 该命令的功能是什么?

匹配a字母连续出现三次的字符串 

19、grep "[0-9]\{3\}" test_rules.txt 该命令的功能是什么?

匹配包含连续的三个数字的字符串 

20、grep "^[0-9]\{3,\}[a-z]" test_rules.txt该命令的功能是什么?

匹配最少用连续三个数字开头的行

21、grep "sa\{1,3\}i" test_rules.txt该命令的功能是什么?

匹配在字母s和字母i之间有最少一个a，最多三个a 

22、cut -f 2 student.txt 该命令的功能是什么?

提取第2个字段(列)

23、cut -f 2,4 student.txt该命令的功能是什么?

提取第2、4个字段(列)

24、cut -d ":" -f 1,3 /etc/passwd该命令的功能是什么?

提取/etc/passwd的第1和3列，并用:号隔开 

25、df -h | grep "sda2" |cut -d " " -f 5该命令的局限是什么?



26、printf %s 1 2 3 4 5 6该命令的功能是什么?

输出字符串 

27、printf %s %s %s 1 2 3 4 5 6 该命令的功能是什么?

 
28、printf '%s %s %s' 1 2 3 4 5 6该命令的功能是什么?

每三个输出一组

29、printf ‘%s %s %s\n’ 1 2 3 4 5 6该命令的功能是什么?

每三个输出一组，并换行 

30、printf '%s' $(cat student2.txt)该命令的功能是什么?

不调整格式输出 

31、printf '%s\t %s\t %s\t %s\t %s\t %s\n' $(cat student2.txt)该命令的功能是什么?

调整格式输出 

32、print命令与printf命令有什么不同?

**print**
print会在每个输出之后自动加入一个换行符(Linux默认没有print命令)

**printf**
printf是标准格式输出命令，并不会自动加入换行符，如果需要换行符，需要手工添加。

33、df -h |awk '{print $1 "\t" $3}'该命令的功能是什么?

无条件输出第1、3列 

34、awk '{printf $2 "\t" $6 "\n"}' student2.txt 该命令的功能是什么?

无条件输出student2.txt文件的第2、6列 

35、awk 'BEGIN{printf "This is a transcript \n"}{printf $2 "\t" $6 "\n"}' student2.txt该命 令的功能是什么?

所有动作之前执行 

36、cat /etc/passwd | grep "/bin/bash" |awk 'BEGIN{FS=":"}{printf $1 "\t" $3 "\n"}‘该 命令的功能是什么?

FS内置变量 

37、awk 'END{printf "The End\n"}{printf $2 "\t" $6 "\n"}' stu2.txt 该命令的功能是什么?

所有动作之后执行 

38、cat stu2.txt |grep -v Name | awk '$6>=87 {printf $2 "\n"}'该命令的功能是什么?

关系运算符 

39、sed '2p' student2.txt '该命令的功能是什么?

查看文件的第二行 

40、sed -n '2p' student2.txt '该命令的功能是什么?

查看文件的第二行 
读取下一个输入行，用下一个命令处理新的行而不是用第一个命令

41、df -h |sed -n "2p" '该命令的功能是什么?

查看磁盘信息的第二行 
读取下一个输入行，用下一个命令处理新的行而不是用第一个命令

42、sed -n '2,4p' student2.txt '该命令的功能是什么?

输出第二行到第四行的数据 

43、sed '2,4d' student2.txt '该命令的功能是什么?

删除第二行到第四行的数据，但不修改文件本身。

44、sed '2a hello' student2.txt'该命令的功能是什么?

在第二行后追加hello 
45、sed '2i cao \zhao' student2.txt'该命令的功能是什么?

在第二行的前面插入两行数据cao和zhao 

46、sed '2c No such person' student2.txt'该命令的功能是什么?

数据替换 

47、sed '3s/74/99/g' student2.txt该命令的功能是什么?

把第三行中的74替换为99 

48、sed -i '3s/74/99/g' student2.txt该命令的功能是什么?

将替换写入文件 

49、sed -e 's/Lisi//g;s/Wangwu//g' student2.txt 该命令的功能是什么? (提醒:22~49的就是Shell编程其中三剑客了。)

同时把Lisi和Wangwu替换为空 

50、sort /etc/passwd该命令的功能是什么?

排序用户信息文件

51、sort -r /etc/passwd该命令的功能是什么?

反向排序 

52、sort -t ":" -k 3,3 /etc/passwd该命令的功能是什么?

指定分隔符为“:”，用第三字段开头，第三字段结尾排序，就是只用第三字段排序 

53、sort -n -t ":" -k 3,3 /etc/passwd该命令的功能是什么?

以数值来排序

54、wc -l /etc/passwd该命令的功能是什么?

统计文件行数

55、test -e /root/install.log该命令的功能是什么?

判断该文件是否存在(存在为真)

56、[ -e /root/install.log ]该命令的功能是什么?

判断该文件是否存在(存在为真)

57、[ -d /root ] && echo "yes" || echo "no"该命令的功能是什么?

第一个判断命令如果正确执行，则打印“yes” 否则打印“no”

58、[ -w /root/student2.txt ] && echo yes || echo no该命令的功能是什么?

判断文件是否有写权限 

59、[ /root/student2.txt -ef /tmp/stu.txt ] && echo yes || echo no该命令的功能是什么?

测试是否硬链接 

60、[ 23 -gt 24 ] && echo yes || echo no该命令的功能是什么?

判断整数1是否大于整数2(大于为真) 

61、[ -z "$name" ] && echo yes || echo no该命令的功能是什么?

判断name变量是否为空，不为空，返回no 

62、[ "$aa" == "bb" ]&& echo yes || echo no 该命令的功能是什么?

判断变量aa是否等于bb

63、[ -n "$aa" -a "$aa" -gt 23 ] && echo yes || echo no该命令的功能是什么?

判断变量aa是否有值，同时判断变量aa是否 大于23，因为aa的值不大于23，所以第一个 判断值虽然为真，返回的结果也是假 


