# 管道符

## 多命令顺序执行

- ;     多个命令顺序执行，命令之间没有任何逻辑联系
- &&    逻辑与 命令1正确执行，命令2才会执行，否则，命令2不执行
- ||    逻辑或 命令1执行不正确，命令2才会执行，否则，命令2不执行

ls && echo yes || echo no

## 管道符

- | 命令1的输出作为命令2的输入