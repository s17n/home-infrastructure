# Application Integration

## Tibber / MQTT / TSDB
<pre>
                 [---------------]
                 [ tibber-bridge ]-----c o---  443/tcp ---[ api.tibber.com ] 
                 [               ]-----c o--- 1883/tcp ---[ mosquitto      ]
                 [---------------]

                 [---------------]
o--- 1883/tcp ---[ mosquitto     ]
                 [               ]  
                 [---------------]

                 [----------------------------------------]
                 [ tibber-scripts                         ]-----c o---[ Tibber API ] 
                 [----------------------------------------]
o--- cron -------[---c getTomorrowsPrices.sh -------------]-----c o--- file -------[ tibber-data / data-XXX ]
o--- shell ------[---c getLastHourConsumptionData.sh      ]
o--- shell ------[---c getHistoricalConsumptionData.sh ---]-----c o--- file -------[ tibber-data / data-XXX ]
                 [                                        ]
                 [----------------------------------------]

                 [----------------------------------]
                 [ telegraf                         ]-----c o--- 1883/tcp ---[ mosquitto ]
                 [                                  ]-----c o--- 8086/tcp ---[ influxdb  ]
                 [                                  ]
                 [----------------------------------]
                 [           time interval ---------]-----c o--- script call ---[ tibber-script / getLastHour... ]
                 [        file system events -------]-----c o--- file event ----[ tibber-data / data-XXX ]
                 [                                  ]
                 [----------------------------------]


                 [---------------]
o--- 8086/tcp ---[ influxdb      ]
                 [               ]
                 [---------------]

</pre>