---
title: getHeaderField Location NPE
date: 2023-09-11 22:02:19
tags:
- 杂 
---

Caused by: java.lang.NullPointerException: getHeaderField("Location") must not be null


> 开发 idea plugin 报错

### 问题

<!--more-->
```
org.jetbrains.intellij.plugins/gradle-intellij-plugin/1.13.3/9565e720cd0443d2a32f5210d81bf97f3e6af43e/gradle-intellij-plugin-1.13.3-sources.jar!/org/jetbrains/intellij/utils/LatestVersionResolver.kt:23

//定位到源代码
fun fromGitHub(subject: String, url: String): String {
    debug(message = "Resolving latest $subject version")
    try {
        return URL("$url/releases/latest").openConnection().run {
            (this as HttpURLConnection).instanceFollowRedirects = false
            getHeaderField("Location").split('/').last().removePrefix("v")
        }
    } catch (e: Exception) {
        throw GradleException("Cannot resolve the latest $subject version", e)
    }
}

```

- 实际是访问 https://github.com/jetbrains/gradle-intellij-plugin/releases
- 会重定向到 https://github.com/jetbrains/gradle-intellij-plugin/releases/tag/v1.14.1.
- v1.14.1 这里是 latest 版本号
- **getHeaderField("Location").split('/').last().removePrefix("v")**  实际就是取 1.14.1

网络不好或者离线开发的情况下会挂 然后就报错了。。。

### 官方 issue

https://github.com/JetBrains/gradle-intellij-plugin/issues/1309 【没用】

https://github.com/JetBrains/gradle-intellij-plugin/issues/960 【解决】

### 解决

启用离线模式运行。。。

![请添加图片描述](./../images/3d3c9636e16043a89e67d8aa3d43b1be.jpeg)
