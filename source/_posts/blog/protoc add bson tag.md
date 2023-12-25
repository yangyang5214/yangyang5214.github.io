---
title: protoc add bson tag
date: 2023-12-25 21:35:05
tags:
- 杂 
---



> add bson tag for *pb.go


<!--more-->
```
#!/bin/bash


function add_tag() {
  if [[ $(uname) == "Darwin" ]]; then
      # macOS
      sed -i '' -E 's/json:"([^"]*)"(.*)$/json:"\1" bson:"\1"\2/g' "$1"
  else
      # Linux
      sed -i -E 's/json:"([^"]*)"(.*)$/json:"\1" bson:"\1"\2/g' "$1"
  fi
}

# api is protoc out dir
files=$(find api -type f -name '*.pb.go' ! -name "*http.pb.go" ! -name "*grpc.pb.go")

for proto in $files ; do
  echo 'add bson tag: '$proto
  add_tag "$proto"
done
```
