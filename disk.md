# 磁盘

## 管理

### `df`

查看磁盘分区使用状况

- -l 仅显示本地磁盘（默认）
- -a 显示所有文件系统的磁盘使用情况，包含 /proc/
- -h 以1024进制计算最合适的单位显示磁盘容量
- -H 以1000进制计算最合适的单位显示磁盘容量
- -T 显示磁盘分区类型 ext3 ext4
- -t 显示指定类型文件系统的磁盘分区
- -x 不显示指定类型文件系统的磁盘分区

### `du`

统计磁盘上的文件大小

- -b 单位 byte
- -k 单位 KB
- -m 单位 MB
- -h 单位 1024进制的合适单位
- -H 单位 1000进制的合适单位
- -s 单位 指定统计目标

## 分区

- 主分区和扩展分区总数不能超过4个
- 扩展分区最多只能有一个
- 扩展分区不能直接存取数据，内部建立逻辑分区实现存取

### `fdisk`

fdisk -l
fdisk /dev/sdb
> m  # menu

### 分区模式

#### MBR

- 主分区不超过4个
- 单个分区容量最大2TB

#### GPT

- 主分区个数“几乎”没有限制 （最多128个）
- 单个分区容量”几乎“ 没有限制(18EB)

parted

> help # help list

select /dev/sdc
mklabel msdos/gpt
print
print all
> 交互模式
> 命令模式

mkpart
4k对齐

mkpart partiton_name 2000 3000

rm 3

unit GB

quit

## 格式化

mkfs

mkfs.ext3 /dev/sdb2

mkfs -t ext4 /dev/sdb3

## 挂载

mkdir -p /mnt/imooc

mount /dev/sdb1 /mnt/imooc

unmount /mnt/imooc

上述命令是临时挂载，下次开机不起作用

vim /etc/fstab

/dev/sdb1 /mnt/imooc ext3 defaults 0 0
开机自动挂载

## swap

- 建立一个普通Linux分区（p/e）
- 修改分区类型的16进制编码
- 格式化交换分区
- 启用交换分区

fdisk /dev/sdb

p
t
6
L
82
p

mkswap /dev/sdb6
swapon /dev/sdb6

free

swapoff /dev/sdb6
