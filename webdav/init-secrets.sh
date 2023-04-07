#!/bin/sh

exitCode=0
composeDir="$(dirname $0)"

if ! [ -d $composeDir/secrets ];
then 
    mkdir $composeDir/secrets
    lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi
fi

truncate -s 0 $composeDir/secrets/.htpasswd
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

htpasswd -nb $(op read op://home-infrastructure/webdav-user/user01/username) $(op read op://home-infrastructure/webdav-user/user01/password) >> $composeDir/secrets/.htpasswd
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi
htpasswd -nb $(op read op://home-infrastructure/webdav-user/user02/username) $(op read op://home-infrastructure/webdav-user/user02/password) >> $composeDir/secrets/.htpasswd
lec=$?; if [ "$lec" -gt "$exitCode" ]; then exitCode=$lec; fi

exit $exitCode