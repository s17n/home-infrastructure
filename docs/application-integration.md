# Application Integration

## Grafana

<pre>
                 [---------------]
o--- network ----[ grafana       ]-----c o--- network ---[ influx         ] 
                 [               ]-----c o--- network ---[ mosquitto      ]
                 [               ]-----c o--- network ---[ prometheus     ]
                 [               ]-----c o--- network ---[ loki           ]
                 [---------------]
</pre>

## Smart Home 
<pre>
tbd
</pre>

## Devonthink 
<pre>
tbd
</pre>

## Tibber / MQTT / TSDB
<pre>
                 [---------------]
                 [ tibber-bridge ]-----c o---  443/tcp ---[ api.tibber.com ] 
                 [               ]-----c o--- 1883/tcp ---[ mosquitto      ]
                 [---------------]

                 [---------------]
o--- network ----[ mosquitto     ]
                 [               ]  
                 [---------------]

                 [----------------------------------------]
                 [ tibber-scripts                         ]-----c o--- network --[ Tibber API ] 
                 [----------------------------------------]
o--- cron -------[---c getTomorrowsPrices.sh -------------]-----c o--- file -----[ tibber-data / data-XXX ]
o--- shell ------[---c getLastHourConsumptionData.sh      ]
o--- shell ------[---c getHistoricalConsumptionData.sh ---]-----c o--- file -----[ tibber-data / data-XXX ]
                 [                                        ]
                 [----------------------------------------]

                 [----------------------------------]
                 [ telegraf                         ]-----c o--- network --------[ mosquitto ]
                 [                                  ]-----c o--- network --------[ influxdb  ]
                 [                                  ]
                 [----------------------------------]
                 [           time interval ---------]-----c o--- shell script ---[ tibber-script / getLast... ]
                 [        file system events -------]-----c o--- file event -----[ tibber-data / data-XXX ]
                 [                                  ]
                 [----------------------------------]


                 [---------------]
o--- 8086/tcp ---[ influxdb      ]
                 [               ]
                 [---------------]

</pre>