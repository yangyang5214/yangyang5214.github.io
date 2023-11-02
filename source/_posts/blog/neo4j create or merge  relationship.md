---
title: neo4j create or merge  relationship
date: 2023-11-02 16:46:56
tags:
- neo4j 
---

https://neo4j.com/docs/apoc/5/overview/apoc.merge/apoc.merge.relationship/



<!--more-->
```
MATCH (p:Person {name: "Tom Hanks"})
MATCH (m:Movie {title:"You've Got Mail"})
MERGE (p)-[rel:ACTED_IN {roles:['Joe Fox']}]->(m)
ON CREATE SET rel.created = datetime()
ON MATCH SET rel.lastSeen = datetime()
RETURN rel;
```

or 

```
MATCH (p:Person {name: "Tom Hanks"})
MATCH (m:Movie {title:"You've Got Mail"})
CALL apoc.merge.relationship(p, "ACTED_IN",
  {roles:['Joe Fox']},
  {created: datetime()},
  m,
  {lastSeen: datetime()}
)
YIELD rel
RETURN rel;
```