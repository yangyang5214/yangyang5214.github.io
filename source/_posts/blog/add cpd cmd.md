---
title: add cpd cmd
date: 2023-11-10 17:51:00
tags:
- 杂 
---


> 支持快捷复制 file:///Users/xxx/Pictures/Photos%20Library.photoslibrary/private/com.apple.Photos/ExternalEditSessions/28774CA9-3961-4284-B01E-10EBA01C43B6/IMG_9750.png 


- vim .zshrc

<!--more-->
```
cpd() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: cpd <source_url> <destination>"
    return 1
  fi

  local source_url="$1"
  local destination="$2"
  local decoded_source
  decoded_source=$(python -c "import urllib.parse; print(urllib.parse.unquote('$source_url')[7:] if '$source_url'.startswith('''file://''') else '$source_url')")
  cp $decoded_source $destination

}
```

- source .zshrc

