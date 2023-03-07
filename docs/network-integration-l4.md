# Network Integration

## Grafana
<pre>
                 [------------------]
o--- 3000/tcp ---[ grafana          ]-----c o--- 8086/tcp ---[ influxdb   ]
                 [                  ]-----c o--- 1883/tcp ---[ mosquitto  ]
                 [                  ]-----c o--- 9090/tcp ---[ prometheus ]
                 [                  ]-----c o--- 3100/tcp ---[ loki       ]
                 [------------------]

</pre>

## Smart Home 
<pre>
                 [------------------]
o--- 8581/tcp ---[ homebridge       ]
o--- ..../... ---[                  ]
                 [                  ]
                 [------------------]

</pre>

## Devonthink 
<pre>
                 [------------------]
o--- 8008/tcp ---[ webdav           ]
                 [                  ]
                 [------------------]
</pre>

## Tibber / MQTT / TSDB
<pre>
                 [------------------]
                 [ tibber-bridge    ]-----c o---  443/tcp ---[ api.tibber.com ] 
                 [                  ]-----c o--- 1883/tcp ---[ mosquitto      ]
                 [------------------]

                 [------------------]
                 [ tibber-scripts   ]-----c o---  443/tcp ---[ api.tibber.com ] 
                 [                  ]
                 [------------------]

                 [------------------]
o--- 1883/tcp ---[ mosquitto        ]
                 [                  ]  
                 [------------------]

                 [------------------]
                 [ telegraf         ]-----c o--- 1883/tcp ---[ mosquitto ]
                 [                  ]-----c o--- 8086/tcp ---[ influxdb  ]
                 [                  ]
                 [------------------]

                 [------------------]
o--- 8888/tcp ---[ chronograf       ]
                 [                  ]
                 [------------------]

                 [------------------]
o--- 8086/tcp ---[ influxdb         ]
                 [                  ]
                 [------------------]

</pre>

## Log Aggregation
<pre>
                 [------------------]
o--- 3100/tcp ---[ loki             ]
                 [                  ]
                 [------------------]

                 [------------------]
o--- 1514/tcp ---[ promtail         ]-----c o--- 3100/tcp ---[ loki ]
                 [                  ]
                 [------------------]
 
</pre>

## Monitoring
<pre>
                 [-------------------------]
o--- 9090/tcp ---[ prometheus              ]-----c o--- 9100/tcp ---[[ node-exporter ]]
                 [                         ]                        [[ 192.168.1.x   ]]
                 [-------------------------]

                 [-------------------------]
o--- 9100/tcp ---[ node-exporter           ]
                 [                         ]
                 [-------------------------]
</pre>

## Network Operations

<pre>
                 [-------------------------]
o----- 80/tcp ---[ traefik                 ]
o---- 443/tcp ---[---                      ]
                 [  |-- grafana.DN --------]-----c o--- 3000/tcp ---[ grafana          ] 
                 [  |-- devonthink.DN -----]-----c o--- 8008/tcp ---[ webdav           ]
                 [  |-- homebridge.DN -----]-----c o--- 8581/tcp ---[ homebridge       ]
                 [  |-- portainer.DN ------]-----c o--- 9000/tcp ---[ portainer        ]
                 [  |-- traefik.DN --------]-----c o--- 8080/tcp ---[ traefik          ]
                 [  |-- pihole.DN ---------]-----c o---   81/tcp ---[ pihole           ]
                 [  |-- unifi.DN ----------]-----c o--- 8443/tcp ---[ unifi-controller ]
                 [                         ]
                 [                         ]-----c o---  443/tcp ---[ cloudflare.com   ]
                 [-------------------------]

                 [-------------------------]
o----- 53/tcp ---[ pi-hole                 ]-----c o---   53/tcp ---[ 1.1.1.1 ]
o----- 53/udp ---[                         ]-----c o---   53/udp ---[ 1.1.1.1 ]
o----- 81/tcp ---[                         ]
                 [                         ]
                 [-------------------------]

                 [-------------------------]
o--- 1900/udp ---[ unifi-controller        ]
o--- 3478/udp ---[                         ]
o--- 8080/tcp ---[                         ]
o--- 8443/tcp ---[                         ]
o-- 10001/udp ---[                         ]
                 [                         ]
                 [-------------------------]
</pre>

## System Operations
<pre>
                 [-------------------------]
o--- 8000/tcp ---[ portainer               ]-----c o--- 4243/tcp ---[[ Docker API     ]]
o--- 9000/tcp ---[                         ]                        [[ 192.168.1.xxx  ]]
                 [                         ]
                 [-------------------------]

</pre>

