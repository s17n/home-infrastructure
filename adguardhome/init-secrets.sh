#!/bin/sh

exitCode=0
composeDir="$(dirname $0)"

op inject --file-mode 644 -f -i $composeDir/.secrets.template.env -o $composeDir/.secrets.env 
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

op inject --file-mode 644 -f -i $composeDir/config/AdGuardHome.template.yaml -o $composeDir/config/AdGuardHome.yaml 
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

exit $exitCode