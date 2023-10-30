---
title: protobuf timestamp to local time
date: 2023-10-30 21:16:16
tags:
- 杂 
---

<!--more-->
```
func GetLocalTime(t *timestamppb.Timestamp) time.Time {
	if t != nil {
		return time.Unix(t.GetSeconds(), int64(t.GetNanos())).Local()
	}
	return time.Time{}.Local()
}
```