#!/bin/sh

composeDir="$(dirname $0)"

#op inject -f -i $composeDir/.secrets.template.env -o $composeDir/.secrets.env

if ! [ -d $composeDir/secrets ];
then 
    mkdir $composeDir/secrets
fi

truncate -s 0 $composeDir/secrets/.htpasswd

htpasswd -nb $(op read op://home-infrastructure/webdav-user/user01/username) $(op read op://home-infrastructure/webdav-user/user01/password) >> $composeDir/secrets/.htpasswd
htpasswd -nb $(op read op://home-infrastructure/webdav-user/user02/username) $(op read op://home-infrastructure/webdav-user/user02/password) >> $composeDir/secrets/.htpasswd