---
title: auto format code
date: 2023-10-30 20:10:55
tags:
- 杂 
---



## How to auto format code in WebStorm?

一个项目，直接全局格式化的快速方法。

Format files from the command line

<!--more-->
```
# my case in mac 
➜  bin pwd
/Users/xxx/Library/Application Support/JetBrains/Toolbox/apps/WebStorm/ch-0/231.8770.64/WebStorm.app/Contents/bin
➜  bin ./format.sh -s ~/Default.xml  -r /xxxx 
```

 - Default.xml export form WebStorm.(Setting->Editor->Code Style-> Export)
 - -r  set project_dir


## Reference

https://www.jetbrains.com/help/webstorm/command-line-formatter.html#options

