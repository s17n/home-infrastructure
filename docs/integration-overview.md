## Network Integration

### DASHBOARDS: 
<pre>
o--- 3000/tcp ---[ Grafana       ]-----c o--- 8086/tcp ---[ influxdb      ]
                 [               ]  |--c o--- 1883/tcp ---[ mosquitto     ]
                 [               ]  |--c o--- 9090/tcp ---[ prometheus    ]
                 [               ]  |--c o--- 3100/tcp ---[ loki          ]

</pre>

### TIBBER/SHELLY DATA COLLECTION:
<pre>
                 [ Tibber Bridge ]-----c o---  443/tcp ---[ api.tibber.com ] 
                 [               ]  |--c o--- 1883/tcp ---[ mosquitto      ]
                 [               ]

o--- 1883/tcp ---[ Mosquitto     ]

                 [ Telegraf      ]-----c o--- 1883/tcp ---[ Mosquitto     ]
                 [               ]  |--c o--- 8086/tcp ---[ Influxdb      ]

o--- 8086/tcp ---[ Influxdb      ]
</pre>

### LOG AGGREGATION:
<pre>
o--- 3100/tcp ---[ Loki          ]

o--- 1514/tcp ---[ Promtail      ]-----c o--- 3100/tcp ---[ Loki          ]

</pre>

### MONITORING:
<pre>
o--- 9090/tcp ---[ Prometheus    ]-----c o--- 9100/tcp ---[ Node Exporter ]
                 [               ]                        [ 192.168.1.x   ]

o--- 9100/tcp ---[ Node Exporter ]
                 [ 192.168.1.x   ]
                 [               ]
</pre>

### SYSTEM/OTHER:
<pre>

o----- 80/tcp ---[ Traefik       ]-----c o---  443/tcp ---[ cloudflare.com ]
o---- 443/tcp ---[               ]
                 [               ]

o--- 8000/tcp ---[ Portainer     ]
o--- 9000/tcp ---[               ]
                 [               ]

o--- 1900/udp ---[ Unifi-        ]
o--- 3478/udp ---[ Controller    ]
o--- 8080/tcp ---[               ]
o--- 8443/tcp ---[               ]
o-- 10001/udp ---[               ]
                 [               ]

o----- 53/tcp ---[ Pi-Hole       ]
o----- 53/udp ---[               ]
o----- 81/tcp ---[               ]
                 [               ]

o--- 8008/tcp ---[ WebDAV        ]
                 [               ]
</pre>

## File System Integration
