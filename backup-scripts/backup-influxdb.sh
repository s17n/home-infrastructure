#!/bin/bash

containerName=influxdb
timestamp=$(date "+%Y%m%d-%H%M")

backupDestDir=$HOME/backups/local/influxdb-app/$timestamp

echo "Start influxdb backup of all databases to: $backupDestDir"
docker exec -it $containerName influxd backup -portable /backup-dst/$timestamp
sudo chown -hR $USER $backupDestDir
sudo chgrp -hR $USER $backupDestDir