# 正则表达式 

用于字符串的模式分割、匹配、查找及替换操作。

通配符用来匹配符合条件的文件名，是完全匹配。
- ls find cp 不支持正则表达式，所以只能使用Shell自己的通配符来进行匹配。
- *
- ?
- [ ]

正则表达式用来在文件中匹配符合条件的字符串，正则是包含匹配
- grep awk sed 等命令可以支持正则表达式

## 基础正则表达式

- *                      前一个字符匹配0次或任意多次        a\* aa\* aaa\*
- .                      匹配除了换行符外任意一个字符
- ^                      匹配行首 ^a
- $                      匹配行尾 b$ ^$匹配空白行
- [ ]                    匹配中括号中指定的任意一个字符，只匹配一个字符
- [^]                    匹配除中括号的字符以外的任意一个字符
- \                      转义符
- \\{n\\}                表示前面的字符恰好出现n次 定界符
- \\{n,\\}               表示前面的字符出现不小于n次
- \\{n,m\\}              表示前面的字符至少出现n次，最多出现m次

## 扩展正则表达式

- ?
- ()

# 字符截取命令

## cut

列提取命令

cut [option] file\_name

- -f column\_number 提取第几列
- -d 分隔符 默认制表符 按照指定分隔符分隔列

df -h | cut -f 1,3 -d " " # 截取规律文件，不适用df

## printf

printf '输出类型输出格式' 输出内容

输出类型
- %ns        输出字符串  n是数字指代输出几个字符
- %ni        输出整数    n是数字指代输出几个数字
- %m.nf      输出浮点数  m 整数位数 n 小数位数

输出格式
- \n
- \t

不支持数据流操作，管道符

awk 命令的输出中支持print和printf命令
- print    print会在每个输出之后自动加入一个换行符，Linux 默认没有 print 命令
- printf   printf 是标准格式输出命令，并不会自动加入换行符，如果需要换行，手动加入换行符

## awk

awk 'pattern1{action1}pattern2{action2}...' file\_name

Pattern
- 一般使用关系表达式作为条件 
- x > 10
- x >= 10
- x <= 10

Action
- 格式化输出
- 流程控制语句

awk '{printf $2 "\t" $4 "\n"}' students.txt
awk '{print $2 "\t" $4}' students.txt

df -h | grep "/dev/sda5" | awk '{print $5}' | cut -d "%" -f 1

### BEGIN

awk 'BEGIN{print "This is test"}{print $2 "\t" $4}' students.txt

### END
awk 'END{print "This is test"}{print $2 "\t" $4}' students.txt

### FS

cat /etc/passwd | grep "/bin/bash" | awk 'BEGIN{FS=":"}{print $1 "\t" $3}'

## sed

字符替换命令

sed [option] '[action]' file\_name

option
- -n 一般sed命令会把所有数据都输出到屏幕，如果加入此选择则只会把经过sed命令处理过的行输出到屏幕
- -e 允许对输入数据经过多条sed命令编辑 ; 分隔
- -i 用sed的修改结果直接修改读取数据的文件，而不是由屏幕输出

action

- a 追加        在当前行后添加一行或多行
- c 行替换      用c后面的字符串替换原数据行
- i 插入        在当前行前插入一行或多行
- d 删除        删除指定的行
- p 打印        输出指定行
- s 字串替换    "行范围s/旧字串/新字串/g"

sed -n '2p' students.txt
sed '2,4d' students.txt
sed '2i insert' students.txt
sed '2a append' students.txt

## sort

sort [option] file\_name

option
- -f          忽略大小写
- -r          reverse
- -n          以数值型排序，默认使用字符串型排序
- -r          反向排序
- -t          指定分隔符，默认是制表符
- -k n[,m]    按照指定的字段范围排序。从第n字段开始，m字段结束（默认到行尾）

sort -n -t ":" -k "3,3" /etc/passwd

## wc

wc [option] file\_name

option
- -l   line count
- -w   word count
- -m   字符数
