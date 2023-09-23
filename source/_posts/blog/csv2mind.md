---
title: csv2mind
date: 2023-09-23 12:48:04
tags:
- 小攻 
---


> 需求点，来自于，需要调试一个程序，最后有输出结果，每次结果的统计值是不一样的。需要向上汇报，那就需要转换成类似脑图的结果，可以直观展示结果。那就是一个无脑且浪费时间的一个机械操作。

https://github.com/yangyang5214/btl

ok, 文件就转换为: 给定 csv 文件，我需要根据某些字段 **group & count**.

类似，

<!--more-->
### 源文件

```
Type,Msg,Optimal
百度引擎,111,淘汰
微软大模型,111,淘汰
百度引擎,111,加入最优集
```

### 输出

![](../images/ec61c00eb3f6959b160f01f78d6b00e4.png)


### 使用

```
btl csv2mind -f example/demo.jsonl -g Optimal,Type


cat demo.md

# demo

## 加入最优集 (1)

### 百度引擎 (1)

## 淘汰 (2)

### 百度引擎 (1)

### 微软大模型 (1)

```

该工具会生成 同名的 markdown 文件，然后通过在线的脑图工具做个渲染，就可以了。


### 实际

> 没啥机密吧

![](../images/f384df81f76bc213d89cc288e4efe9ae.png)


### 在线脑图工具

https://markmap.js.org/repl

https://wanglin2.github.io/mind-map/#/
