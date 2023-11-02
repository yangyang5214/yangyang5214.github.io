---
title: neo4j install apoc with docker
date: 2023-11-02 16:58:52
tags:
- neo4j 
---


### docker run neo4j

- install 

<!--more-->
```
cd /data/neo4j/data
mkdir plugins

pushd plugins
wget https://github.com/neo4j/apoc/releases/download/5.13.0/apoc-5.13.0-core.jar
popd
```
- run 

```
docker run \
    --name neo4j \
    -p7474:7474 -p7687:7687 \
    -d \
    -v /data/neo4j/data:/data \
    -v /data/neo4j/logs:/logs \
    -v /data/neo4j/import:/var/lib/neo4j/import \
    -v /data/neo4j/plugins:/plugins \
    --env NEO4J_AUTH=neo4j/pwd \
    neo4j:5.13.0
```


### Reference

https://github.com/neo4j/apoc/

https://neo4j.com/docs/apoc/5/installation/