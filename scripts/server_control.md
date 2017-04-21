# 主控脚本

- 操作系统信息
- 操作系统运行状态
- 分析应用状态
- 应用日志分析

## vim 

### 设置缩进

```shell
set autoindent
set cindent
```

### 自动添加文件头

```shell
autocmd BufNewFile *.py,*.sh, exec ":call SetTitle()"
let $author_name = "LiBenuo"
let $author_email = "1214004817@qq.com"

func SetTitle()
if &filetype == 'sh'
call setline(1, "\#########################################")
call append(line("."), "\# File Name: ".expand("%"))
call append(line(".")+1, "\# Author: ".$author_name)
call append(line(".")+2, "\# email: ".$author_email)
call append(line(".")+3, "\# Created Time: ".strftime("%c"))
call append(line(".")+4, "\#===========================")
call append(line(".")+5, "\#!/bin/bash")
call append(line(".")+6, "")
else
call setline(1, "\#########################################")
call append(line("."), "\# File Name: ".expand("%"))
call append(line(".")+1, "\# Author: ".$author_name)
call append(line(".")+2, "\# email: ".$author_email)
call append(line(".")+3, "\# Created Time: ".strftime("%c"))
call append(line(".")+4, "\#===========================")
call append(line(".")+5, "\#!/usr/bin/python")
call append(line(".")+6, "")
endif
```

### shell highlight

echo -e color + content + after\_color
```shell
echo -e "\e[1;30m Hello \e[1;0m"
echo -e "\e[1;30m" "Hello" $(tput sgr0)
```

### 关联数组

- 普通数组    只能使用整数作为数组索引
- 关联数组    可以使用字符串作为数组索引

declare -A ass\_array
