#!/bin/bash

container=$1
timestamp=$(date "+%Y%m%d-%H%M")
backupDestDir=$HOME/backups/local/$container/$timestamp
backupDestFile="$container"_"$timestamp.tar"

containerPath=""
case $container in

    grafana)
        containerPath=/var/lib/grafana
        ;;
    influxdb)
        containerPath=/var/lib/influxdb
        ;;
    homebridge)
        containerPath=[homebridge-path]
        ;;
    *)
    ;;
esac

echo "Start volume backup for container: $container for container path (volume mount): $containerPath to host machine path: $backupDestDir/$backupDestFile"
docker run --rm --volumes-from $container -v $backupDestDir:/backup-dst ubuntu tar cvf /backup-dst/$backupDestFile $containerPath
sudo chown -hR $USER $backupDestDir
sudo chgrp -hR $USER $backupDestDir
