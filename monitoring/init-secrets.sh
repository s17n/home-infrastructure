#!/bin/sh

exitCode=0
composeDir="$(dirname $0)"

op inject --file-mode 644 -f -i $composeDir/alertmanager/alertmanager-template.yml -o $composeDir/alertmanager/alertmanager.yml
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

exit $exitCode