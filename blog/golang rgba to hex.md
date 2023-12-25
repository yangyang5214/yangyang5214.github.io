---
title: golang rgba to hex
date: 2023-12-25 21:35:05
tags:
- 杂 
---



> golang RGBA color to hex


<!--more-->
```
import 	"image/color"

func ColorToHex(c color.Color) string {
	r, g, b, _ := c.RGBA()
	return fmt.Sprintf("#%02X%02X%02X", r>>8, g>>8, b>>8)
}
```
