# 常用命令

## 命令基本格式

```shell
[root@localhost ~]#

# root       当前登录用户
# localhost  主机名
# ~          当前所在位置
# #          超级用户提示符
# $          普通用户提示符
```

命令 [选项] [参数]
- 个别命令使用不遵循此格式
- 当有多个选项时，可以写在一起
- 简化选项与完整选项 -a == --all

-rw-r--r--.
- - 文件类型
> - 
> d
> l
> c
> b

- rw- u 
- r-- g
- r-- o
> r
> w
> x

- . ACL权限

## 文件处理命令

### 目录处理命令

mkdir -p [dir name]
make directories

cd 
change directory

> `ctrl` + `l` == clear

pwd
print working directory

rmdir 删除空目录 少用

rm -r 删除目录
rm -rf

cp
-r 复制目录
-p 连带文件属性复制
-d 若源文件是链接文件，则复制链接属性
-a 相当于 -pdr

mv [源文件或目录] [目标目录]
- 不需要 -r
- 剪切 ／ 重命名


#### 常用目录

/           根目录
/bin        命令保存目录（普通用户就可以读取的命令）
/boot       启动目录，启动相关文件
/dev        设备文件保存目录
/etc        配置文件保存目录
/home       普通用户的家目录
/lib        系统库保存目录
/mnt        系统挂载目录
/media      挂载目录
/root       超级用户的家目录
/tmp        临时目录
/sbin       命令保存目录（超级用户才能使用的目录）
/proc       直接写入内存的, 内存挂载点
/sys        写入内存
/usr        系统软件资源目录
/usr/bin/   系统命令（普通用户）
/usr/sbin/  系统命令（超级用户）
/var        系统相关文档内容

### 文件处理命令

### 链接命令

ln -s [源文件] [目标文件]
link

- 硬链接
1. 拥有相同的i节点和存储block块，可以看作是一个文件
2. 可通过i节点识别
3. 不能跨分区
4. 不能针对目录使用
5. 一个文件的两个接入点

- 软链接
1. 类似Windows快捷方式
2. 软链接拥有自己的I节点和Block块，但是数据块中只保存原文件的文件名和I节点号，并没有实际的文件数据
3. lrwxrwxrwx l 软链接 文件权限都为 rwxrwxrwx
4. 修改任意文件，另一个都改变
5. 删除原文件，软链接不能使用
6. 不在同一目录下时，一定要写绝对路径


## 文件搜索命令

### 文件搜索命令 `locate`

locate 文件名
- 在后台数据库中按文件名搜索，搜索速度比较快
- /var/lib/mlocate locate命令所搜索的后台数据库
- updatedb 更新数据库
- locate locate
- 只能按文件名搜索
- /etc/updatedb.conf

```shell
# 开启搜索限制
PRUNE_BIND_MOUNTS="yes"

# 搜索时不搜索的文件系统
PRUNEFS=

# 搜索时不搜索的文件类型
PRUNENAMES=

# 搜索时不搜索的路径
PRUNEPATHS=
```

### 命令搜索命令 `whereis` /  `which` / `what`

whereis command
- 搜索命令所在路径及帮助文档所在的位置
- -b 只查找可执行文件
- -m 只查找帮助文件

which
- 命令所在位置
- 命令别名

只能看到外部安装的命令，看不到内置命令

echo $PATH

### 文件搜索命令 `find`

find [搜索范围] [搜索条件]


- 避免大范围搜索，会非常耗费资源
- find 是在系统当中搜索符合条件的文件名
- 如果需要匹配，使用通配符匹配，通配符是完全匹配
- -iname    不区分大小写
- -user     按照所有者搜索
- -nouser   查找没有所有者的文件
- -mtime    修改文件内容时间
- -ctime    改变文件属性时间
- -atime    文件访问时间
- +10       10天前
- 10        10天当天  
- -10       10天内
- -size     按照文件大小 k M 不带单位 表示扇区数
- +25k
- 25k
- -25k
- -inum     按照i节点搜索
- -a        and 逻辑与 
- -o        or 逻辑或 
- -exec command {}\;  example: -exec ls -i {}\;

> Linux 中的通配符
> *    匹配任意内容
> ?    匹配任意一个字符
> []   匹配任意一个中括号内的字符

### 字符串搜索命令 `grep`

grep [选项] 字符串 文件名
- 在文件当中匹配符合条件的字符串 行
- -i 忽略大小写
- -v 排除指定字符串

### `find` VS. `grep`

find
- 在系统中搜索符合条件的文件名
- 如果需要匹配，使用通配符匹配，通配符是完全匹配

grep
- 在文件当中搜索符合条件的字符串
- 如果需要匹配，使用正则表达式进行匹配，正则表达式是包含匹配

## 帮助命令

## 压缩和解压缩命令

### .zip

#### 压缩

zip 压缩文件名 源文件

zip -r 压缩文件名 源目录

#### 解压

unzip 压缩文件

### gz

#### 压缩

gzip 源文件 # 压缩为 .gz 格式的压缩文件，源文件会消失
gzip -c 源文件 > 压缩文件 # 压缩为 .gz 格式，源文件保留
gzip -r 目录 # 压缩目录下的所有子文件，但是不能压缩目录

#### 解压

gzip -d 压缩文件
gunzip 压缩文件
gzip -r 目录 

### .bz2

bzip2 不能压缩目录

#### 压缩

bzip2 源文件 # 压缩为 .bz2 格式，不保留源文件 
bzip2 -k 源文件 # 压缩之后保留源文件

#### 解压 
bzip2 -d 压缩文件
bunzip2 压缩文件

### .tar.gz .tar.bz2

#### tar
tar -cvf 打包文件名 源文件
-c 打包
-v 显示过程
-f 指定打包后的文件名

tar -xvf 打包文件名
-x 解打包

解决目录不能压缩的问题

tar -zcvf 压缩包名.tar.gz 源文件
tar -zxvf 压缩包名.tar.gz

tar -jcvf 压缩包名.tar.bz2 源文件
tar -jxvf 压缩包名.tar.bz2
tar -jxvf 压缩包名.tar.bz2 -c 解压缩位置

tar -zcvf test.tar.gz sd gz # 压缩多个文件

tar -ztvf test.tar.gz # 查看，不解压

## 关机和重启命令

shutdown [选项] 时间

-c 取消前一个关机命令
-h 关机
-r 重启

halt
poweroff
init 0

reboot
init 6

runlevel

logout

## 其他常用命令

### mount

```shell
# 查询系统中已经挂载的设备
mount

# 依据配置文件 /etc/fstab 的内容，自动挂载
mount -a

```

mount [-t 文件系统] [-o 特殊选项] 设备文件名 挂载点
- -t 文件系统：加入文件系统类型来指定挂载的类型，可以ext3 ext4 iso9660 等文件系统
- -o 特殊选项：可以指定挂载的额外选项

mount -o remount,noexec /home/

#### 挂载光盘

```shell
# 建立挂载点
mkdir /mnt/cdrom/

# 挂载光盘
mount -t iso9660 /dev/sr0 /mnt/cdrom/
mount /dev/sr0 /mnt/cdrom/
```

#### 卸载

```shell
umount 设备文件名／挂载点
```

#### 挂载U盘
```shell
# 查看系统中已经识别的硬盘,查看U盘设备文件名
fdisk -l

# Linux 默认是不支持 NTFS 文件系统的
mount -t vfat /dev/sdb1 /mnt/usb/
```

w
who
last
lastlog
