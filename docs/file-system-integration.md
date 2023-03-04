# File System Integration

This document covers file system integration for:
- Configuration files                       <- no need for system backup (it's in git)  
- Directories for application integration   <- no need for system backp
- Application state                         <- needs system backup
- Other (e.g. log data)                     <- needs attention

## Top Level Components 

- grafana
    - ...

## MQTT & TSDB Components

- tibber-bridge:
    - (no file system integration)

- tibber-scripts:

- mosquitto:
<pre>
    - ./log/:/mosquitto/log/
    - mosquitto-data:/mosquitto/data/
</pre>
- telegraf:
<pre>
     - './telegraf:/etc/telegraf:ro'
     - '${TIBBER_SCRIPTS:-$HOME/home-infrastructure/tibber-scripts}:/etc/tibber/bin:rw'
     - '${TIBBER_DATA:-$HOME/data/tibber}:/etc/tibber/data:rw'
     - '/var/run/docker.sock:/var/run/docker.sock:ro'
     - '/sys:/rootfs/sys:ro'
     - '/proc:/rootfs/proc:ro'
     - '/etc:/rootfs/etc:ro'
</pre>
- influxdb:
<pre>
    - 'influxdb-storage:/var/lib/influxdb'
</pre>
