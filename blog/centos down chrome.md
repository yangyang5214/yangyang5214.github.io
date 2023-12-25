---
title: centos down chrome
date: 2023-12-25 21:35:05
tags:
- 杂 
---

<!--more-->
```
touch /etc/yum.repos.d/google-chreom.repo

[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
```

```
yum -y install google-chrome-stable --nogpgcheck

yum -y groupinstall Fonts
```