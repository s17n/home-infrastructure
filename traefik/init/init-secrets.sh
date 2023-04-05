#!/bin/sh

composeDir="$(dirname $0)/.."

op inject -f -i $composeDir/init/.env.tpl -o $composeDir/.env

if ! [ -f $composeDir/secrets ];
then 
    mkdir $composeDir/secrets
fi

truncate -s 0 $composeDir/secrets/.htpasswd

htpasswd -nb $(op read op://home-infrastructure/traefik-user01/username) $(op read op://home-infrastructure/traefik-user01/password) > $composeDir/secrets/.htpasswd

if ! [ -f $composeDir/secrets/acme.json ]; 
then 
    touch $composeDir/secrets/acme.json
fi