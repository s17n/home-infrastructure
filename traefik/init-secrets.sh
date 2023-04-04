#!/bin/sh

op inject -f -i .env.tpl -o .env

dir=$(dirname $0)

truncate -s 0 $dir/secrets/.htpasswd

htpasswd -nb $(op read op://home-infrastructure/traefik-user01/username) $(op read op://home-infrastructure/traefik-user01/password) > $dir/secrets/.htpasswd

if ! [ -f $dir/secrets/acme.json ]; 
then 
    touch $dir/secrets/acme.json
fi