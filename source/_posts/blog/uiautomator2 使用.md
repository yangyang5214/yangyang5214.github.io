---
title: uiautomator2 使用
date: 2023-10-30 21:16:16
tags:
- 杂 
---


> 简单记录下流程(2年前搞的 今天改东西 忘记了好多)


## adb devices

确保 手机 usb/wifi 成功连接

<!--more-->
```
➜  ~ adb devices 
List of devices attached
13d4cfdf	device
```

## ATX install

```
# 会安装 ATX 到手机
python3 -m uiautomator2 init
```

## install weditor/uiautomator2

```
pip3 install weditor uiautomator2
```

## 启动 weditor

> 启动之后，连不上手机画面。可以看下 ATX 安装&启动没

```
➜  ~ weditor 
listening on http://192.168.31.147:17310
[I 231022 10:22:33 web:2239] 304 GET / (::1) 73.89ms
[I 231022 10:22:34 web:2239] 304 GET /api/v1/version (::1) 2.28ms
[I 231022 10:22:34 web:2239] 101 GET /ws/v1/python (::1) 8.13ms
[I 231022 10:22:34 shell:189] create process pid: 78902
[I 231022 10:22:37 web:2239] 200 POST /api/v1/connect (::1) 1696.
```


![](../images/2992cfadb3b9e02e608c99b9653132ca.png)


## Reference

https://github.com/yangyang5214/uiautomator_spider


