---
title: protobuf_Timestamp_to_local _time
date: 2023-10-26 19:51:10
tags:
- 小攻 
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