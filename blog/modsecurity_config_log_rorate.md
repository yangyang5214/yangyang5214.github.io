---
title: modsecurity_config_log_rorate
date: 2023-10-17 21:00:01
tags:
- 杂 
---


- set modsecurity with logrotate
- reload apachectl config(use graceful)

<!--more-->
```
vim /etc/logrotate.d/modsec_audit

/var/log/modsec_audit.log {
   postrotate 
      apachectl -k graceful > /dev/null 2>/dev/null || true
   endscript
}
```

### reference


https://www.webmastertrouble.com/forum/viewthread.php?thread_id=37

https://stackoverflow.com/questions/31567165/what-is-the-difference-between-apache2-reload-restart-graceful
