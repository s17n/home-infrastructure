#!/bin/sh

exitCode=0
composeDir="$(dirname $0)"

op inject --file-mode 644 -f -i $composeDir/.secrets.template.env -o $composeDir/.secrets.env
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

op inject --file-mode 644 -f -i $composeDir/config/influx-configs.template -o $composeDir/config/influx-configs
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

exit $exitCode