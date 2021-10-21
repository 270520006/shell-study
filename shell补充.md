# shell命令补充

​	将遇到的不会的命令都记到这里！

## grep

grep：强大的文本搜索工具（是一种“贪婪“的工具）

```
grep （global search regular expression(RE) and print out the
line，全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。用于过滤/搜索的特定字符。可使用正则表达式能多种命令配合使用，使用上十分灵活。
```

### 可选项

```
-a --text # 不要忽略二进制数据。 
-A <显示行数> --after-context=<显示行数> # 除了显示符合范本样式的那一行之外，并显示该行之后的内容。 
-b --byte-offset # 在显示符合范本样式的那一行之外，并显示该行之前的内容。 
-B<显示行数> --before-context=<显示行数> # 除了显示符合样式的那一行之外，并显示该行之前的内容。 
-c --count # 计算符合范本样式的列数。 
-C<显示行数> --context=<显示行数>或-<显示行数> # 除了显示符合范本样式的那一列之外，并显示该列之前后的内容。 
-d<进行动作> --directories=<动作> # 当指定要查找的是目录而非文件时，必须使用这项参数，否则grep命令将回报信息并停止动作。 
-e<范本样式> --regexp=<范本样式> # 指定字符串作为查找文件内容的范本样式。 
-E --extended-regexp # 将范本样式为延伸的普通表示法来使用，意味着使用能使用扩展正则表达式。 
-f<范本文件> --file=<规则文件> # 指定范本文件，其内容有一个或多个范本样式，让grep查找符合范本条件的文件内容，格式为每一列的范本样式。 
-F --fixed-regexp # 将范本样式视为固定字符串的列表。 
-G --basic-regexp # 将范本样式视为普通的表示法来使用。 
-h --no-filename # 在显示符合范本样式的那一列之前，不标示该列所属的文件名称。 
-H --with-filename # 在显示符合范本样式的那一列之前，标示该列的文件名称。 
-i --ignore-case # 忽略字符大小写的差别。 
-l --file-with-matches # 列出文件内容符合指定的范本样式的文件名称。 
-L --files-without-match # 列出文件内容不符合指定的范本样式的文件名称。 
-n --line-number # 在显示符合范本样式的那一列之前，标示出该列的编号。 
-q --quiet或--silent # 不显示任何信息。 
-R/-r --recursive # 此参数的效果和指定“-d recurse”参数相同。 
-s --no-messages # 不显示错误信息。 
-v --revert-match # 反转查找。 
-V --version # 显示版本信息。 
-w --word-regexp # 只显示全字符合的列。 
-x --line-regexp # 只显示全列符合的列。 
-y # 此参数效果跟“-i”相同。 
-o # 只输出文件中匹配到的部分。 
```

### 规则表达式

```shell
^        # 锚定行的开始 如：'^grep'匹配所有以grep开头的行。 
$        # 锚定行的结束 如：'grep$'匹配所有以grep结尾的行。 
.        # 匹配一个非换行符的字符 如：'gr.p'匹配gr后接一个任意字符，然后是p。 
*         # 匹配零个或多个先前字符 如：'*grep'匹配所有一个或多个空格后紧跟grep的行。 
.*        # 一起用代表任意字符。 [] # 匹配一个指定范围内的字符，如'[Gg]rep'匹配Grep和grep。 
[^]         # 匹配一个不在指定范围内的字符，如：'[^A-FH-Z]rep'匹配不包含A-R和T-Z的一个字母开头，紧跟rep的行。 
\(..\)       # 标记匹配字符，如'\(love\)'，love被标记为1。 
\<        # 锚定单词的开始，如:'\<grep'匹配包含以grep开头的单词的行。 
\>          # 锚定单词的结束，如'grep\>'匹配包含以grep结尾的单词的行。 
x\{m\}       # 重复字符x，m次，如：'0\{5\}'匹配包含5个o的行。 
x\{m,\}       # 重复字符x,至少m次，如：'o\{5,\}'匹配至少有5个o的行。x\{m,n\} # 重复字符x，至少m次，不多于n次，如：'o\{5,10\}'匹配5--10个o的行。 
\w           # 匹配文字和数字字符，也就是[A-Za-z0-9]，如：'G\w*p'匹配以G后跟零个或多个文字或数字字符，然后是p。 
\W              # \w的反置形式，匹配一个或多个非单词字符，如点号句号等。 
\b              # 单词锁定符，如: '\bgrep\b'只匹配grep。 

```

### 常规用法

* 单文件搜索

```shell
#常规用法
[root@localhost docker-compose]# grep vo compose_zookeeper.yml 
    volumes:
    volumes:
```

* 多文件搜索

```shell
[root@localhost docker-compose]# grep vo compose_zookeeper.yml  compose_v.yml compose_many.yml
compose_zookeeper.yml:    volumes:
compose_zookeeper.yml:    volumes:
compose_v.yml:    volumes:
```

* -v：输出除match_pattern之外的所有行

```shell
[root@localhost docker-compose]# grep vo compose_zookeeper.yml  -v
```

* --color：标记匹配颜色 --color=auto\none 选项

```shell
[root@localhost docker-compose]# grep vo compose_zookeeper.yml  --color=auto
    volumes:
    volumes:
[root@localhost docker-compose]# grep vo compose_zookeeper.yml  --color=none
    volumes:
    volumes:

```

* -E：选项可以用来扩展选项为正则表达式。
  * 下列命令是：匹配改文件下1-9数字的所有行数
  * 搜索带有data和zookeeper的行

```shell
[root@localhost docker-compose]# grep -E "[1-9]+" compose_zookeeper.yml 
version: '2'
  web1:
      - "8888:2181"
    container_name: "zookeeper01"
      mynet03:
        ipv4_address: 11.11.11.12
      -  /home/zookeeper01/zookeeper_data:/data
      -  /home/zookeeper01/conf:/conf
  web2:
      - "8887:2181"
    container_name: "zookeeper02"
      mynet03:
        ipv4_address: 11.11.11.11
      - /home/zookeeper02/zookeeper_data:/data
      - /home/zookeeper02/conf:/conf
  mynet03:
        - subnet: 11.11.11.0/16

[root@localhost docker-compose]# grep -E "data|zookeeper" compose_zookeeper.yml 
    image: wurstmeister/zookeeper
    container_name: "zookeeper01"
      -  /home/zookeeper01/zookeeper_data:/data
      -  /home/zookeeper01/conf:/conf
    image: wurstmeister/zookeeper
    container_name: "zookeeper02"
      - /home/zookeeper02/zookeeper_data:/data
      - /home/zookeeper02/conf:/conf

```

-o：只输出搜索的字段，可以对比看看

```shell
[root@localhost docker-compose]# grep data compose_zookeeper.yml 
      -  /home/zookeeper01/zookeeper_data:/data
      - /home/zookeeper02/zookeeper_data:/data
[root@localhost docker-compose]# grep data compose_zookeeper.yml  -o
data
data
data
data

```

-c:统计行数

-C 3：输出匹配字符后的前后3行

```shell
[root@localhost docker-compose]# grep -c data compose_zookeeper.yml 
2
[root@localhost docker-compose]# grep -C 3 data compose_zookeeper.yml 
      mynet03:
        ipv4_address: 11.11.11.12
    volumes:
      -  /home/zookeeper01/zookeeper_data:/data
      -  /home/zookeeper01/conf:/conf

  web2:
--
      mynet03:
        ipv4_address: 11.11.11.11
    volumes:
      - /home/zookeeper02/zookeeper_data:/data
      - /home/zookeeper02/conf:/conf

```

-n:输出匹配对应字符的所在行数

```shell
[root@localhost docker-compose]# grep -n data compose_zookeeper.yml 
12:      -  /home/zookeeper01/zookeeper_data:/data
24:      - /home/zookeeper02/zookeeper_data:/data
[root@localhost docker-compose]# grep vo compose_many.yml compose_zookeeper.yml compose_v.yml 
compose_zookeeper.yml:    volumes:
compose_zookeeper.yml:    volumes:
compose_v.yml:    volumes:
[root@localhost docker-compose]# grep vo compose_many.yml compose_zookeeper.yml compose_v.yml  -n
compose_zookeeper.yml:11:    volumes:
compose_zookeeper.yml:23:    volumes:
compose_v.yml:10:    volumes:

```

-l：查看文件是否包含此搜索字段

```shell
[root@localhost docker-compose]# grep -l vo compose_zookeeper.yml  compose_many.yml  compose_v.yml 
compose_zookeeper.yml
compose_v.yml
```

. -r:递归搜索文件目录下匹配字段

```shell
[root@localhost docker-compose]# grep vo . -r -n
./compose_v.yml:10:    volumes:
./compose_zookeeper.yml:11:    volumes:
./compose_zookeeper.yml:23:    volumes:
./grepdemo/grepdemo.yml:1:volummsmadasnn
[root@localhost docker-compose]# grep vo . -r
./compose_v.yml:    volumes:
./compose_zookeeper.yml:    volumes:
./compose_zookeeper.yml:    volumes:
./grepdemo/grepdemo.yml:volummsmadasnn
```

-i：忽略大小写

```
[root@localhost docker-compose]# grep VO compose_zookeeper.yml 
[root@localhost docker-compose]# grep VO compose_zookeeper.yml -i
    volumes:
    volumes:
```

-e：匹配多个条件，类似于“|”

```shell
[root@localhost docker-compose]# grep -e vo -e data -e ab compose_zookeeper.yml 
    volumes:
      -  /home/zookeeper01/zookeeper_data:/data
    volumes:
      - /home/zookeeper02/zookeeper_data:/data
```

-q：静默输出

```shell
[root@localhost docker-compose]# grep -e vo -e data -e ab compose_zookeeper.yml -q
[root@localhost docker-compose]# 
# 不会输出任何信息，如果命令运行成功返回0，失败则返回非0值。一般用于条件测试。

```

-A 2：输出目标字段的后2行

```shell
[root@localhost docker-compose]# grep vo compose_zookeeper.yml -A 2
    volumes:
      -  /home/zookeeper01/zookeeper_data:/data
      -  /home/zookeeper01/conf:/conf
--
    volumes:
      - /home/zookeeper02/zookeeper_data:/data
      - /home/zookeeper02/conf:/conf

```

-B 2：输出目标字段的前两段

```shell
[root@localhost docker-compose]# grep vo compose_zookeeper.yml -B 2
      mynet03:
        ipv4_address: 11.11.11.12
    volumes:
--
      mynet03:
        ipv4_address: 11.11.11.11
    volumes:

```

-C 2：输出前二后二

```shell
[root@localhost docker-compose]#  grep vo compose_zookeeper.yml -C 2
      mynet03:
        ipv4_address: 11.11.11.12
    volumes:
      -  /home/zookeeper01/zookeeper_data:/data
      -  /home/zookeeper01/conf:/conf
--
      mynet03:
        ipv4_address: 11.11.11.11
    volumes:
      - /home/zookeeper02/zookeeper_data:/data
      - /home/zookeeper02/conf:/conf
```

