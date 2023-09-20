---
title: LCP06.拿硬币
date: 2023-09-20 22:38:34
tags:
- leetcode 
---



![](./../images/cover/img_13.png)

## 分析

有人相爱，有人夜里看海  终于有个简单的能让我做出来了 嘻嘻


<!--more-->
## 解

```shell
func minCount(coins []int) int {
    var r int
    for _, coin := range coins{
        c, l := coin/2,  coin%2
        r = r + c + l
    }
    return r
}
```