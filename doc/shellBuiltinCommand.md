# Shell Builtin Command

[List of bash builtin commands](https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html)

## type

To determine a command is builtin or not.

```shell
$ type cd
```

## `.`

```
$ . ./hello.sh
```

> Execute the script (even it has no permission).

`source` seem as `.` 

- read script 
- & excute it in the shell 
- & return result or 0 if there is none which means success.
- & return false if the script does not exist.

## `alias`

```
// to list all the alias used by current user
$ alias

// to define alias
# alias myShutdown=`shutdown -h now`
```

> Note: 这样定义alias只能在当前Shell环境中有效。
> 为了确保永远生效，可以将该条目写到/home/user/.bashrc

## `unalias`

```
// to delete all the alias under current shell
$ unalias -a
// to delete by name
$ unalias myShutdown
```

## `bg` `fg` `jobs`


```
$ tar -zcf usr.tgz /usr

# (Ctrl-z 暂停耗时任务)

# jobs 查看暂停的任务
$ jobs

# background
$ bg 1

# foreground
$ fg 1

# put the task background at first
# tar -zcf usr.tgz /usr &
```

## `cd`

## `declare` `typeset`
Shell weak type

## `test`

```
# test EXPRESSION
```
