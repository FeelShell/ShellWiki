# 运算符

Shell 缺点
- 弱类型
- 默认字符串型

## declare

声明变量类型

declare [+/-][option] var\_name

- - 给变量设定类型属性
- + 取消变量的类型属性

声明为数组型 -a
取消数组型   +a

a array
i integer
x evironment export调用此命令
r read-only
p 显示指定变量的被声明类型

declare -i cc=$aa+$bb

## 数值运算方法

expr
let
```shell
aa=11
bb=22
# + 两边的空格不可以省略
dd=$(expr $aa + $bb)

# + 两边的空格不作强制要求
$(($aa + $bb))
$[$aa + $bb]
```

## 变量测试

格式复杂多样，语法简单。
脚本优化使用

x=${y-new\_val}
x=${y:-new\_val}
x=${y+new\_val}
x=${y:+new\_val}
x=${y=new\_val}
x=${y:=new\_val}
x=${y?new\_val}
x=${y:?new\_val}

