# File System Integration

This document covers file system integration for:
- Configuration files                         
- Directories for application integration   
- Application state                         <- needs system backup
- Other (e.g. log data)                     <- needs attention

## Grafana 

- grafana
<pre>
    - './grafana/provisioning/datasources:/etc/grafana/provisioning/datasources'
    - './grafana/grafana.ini:/etc/grafana/grafana.ini'
    - grafana-data:/var/lib/grafana
</pre>

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
