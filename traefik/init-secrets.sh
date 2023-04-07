#!/bin/sh

exitCode=0
composeDir="$(dirname $0)"

op inject --file-mode 644 -f -i $composeDir/.secrets.template.env -o $composeDir/.secrets.env
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

if ! [ -d $composeDir/secrets ];
then 
    mkdir $composeDir/secrets
    lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi
fi

truncate -s 0 $composeDir/secrets/.htpasswd
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

htpasswd -nb $(op read op://home-infrastructure/traefik-user01/username) $(op read op://home-infrastructure/traefik-user01/password) > $composeDir/secrets/.htpasswd
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

if ! [ -f $composeDir/secrets/acme.json ]; 
then 
    touch $composeDir/secrets/acme.json
    lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi
fi

exit $exitCode