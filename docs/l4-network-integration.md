# Network Integration

## Dashboards 
<pre>
o--- 3000/tcp ---[ grafana ]-----c o--- 8086/tcp ---[ influxdb   ]
                 [         ]-----c o--- 1883/tcp ---[ mosquitto  ]
                 [         ]-----c o--- 9090/tcp ---[ prometheus ]
                 [         ]-----c o--- 3100/tcp ---[ loki       ]

</pre>

## Tibber/Shelly Data Collection
<pre>
                 [ tibber-bridge ]-----c o---  443/tcp ---[ api.tibber.com ] 
                 [               ]-----c o--- 1883/tcp ---[ mosquitto      ]

o--- 1883/tcp ---[ mosquitto     ]
                 [               ]  
                 === mosquitto-data:/mosquitto/data/
                 === ./log/        :/mosquitto/log/

                 [ telegraf      ]-----c o--- 1883/tcp ---[ mosquitto ]
                 [               ]-----c o--- 8086/tcp ---[ influxdb  ]
                 [               ]
                 === ${TIBBER_SCRIPTS}:/etc/tibber/bin
                 === ${TIBBER_DATA}   :/etc/tibber/data

o--- 8086/tcp ---[ influxdb      ]
                 [               ]
                 === influxdb-storage:/var/lib/influxdb

</pre>

### LOG AGGREGATION:
<pre>
o--- 3100/tcp ---[ loki     ]

o--- 1514/tcp ---[ promtail ]-----c o--- 3100/tcp ---[ loki ]

</pre>

### MONITORING:
<pre>
o--- 9090/tcp ---[ prometheus    ]-----c o--- 9100/tcp ---[ node-exporter ]
                 [               ]                        [ 192.168.1.x   ]

o--- 9100/tcp ---[ node-exporter ]
                 [ 192.168.1.x   ]
                 [               ]
</pre>

### SYSTEM/OTHER:
<pre>

o----- 80/tcp ---[ traefik       ]-----c o---  443/tcp ---[ cloudflare.com ]
o---- 443/tcp ---[               ]
                 [               ]

o--- 8000/tcp ---[ portainer     ]
o--- 9000/tcp ---[               ]
                 [               ]

o--- 1900/udp ---[ unifi-        ]
o--- 3478/udp ---[ controller    ]
o--- 8080/tcp ---[               ]
o--- 8443/tcp ---[               ]
o-- 10001/udp ---[               ]
                 [               ]

o----- 53/tcp ---[ pi-hole       ]-----c o---   53/tcp ---[ 1.1.1.1 ]
o----- 53/udp ---[               ]-----c o---   53/udp ---[ 1.1.1.1 ]
o----- 81/tcp ---[               ]
                 [               ]

o--- 8008/tcp ---[ webdav        ]
                 [               ]
</pre>

## File System Integration
