#!/bin/sh

composeDir="$(dirname $0)"

op inject -f -i $composeDir/.secrets.template.env -o $composeDir/.secrets.env

op inject -f -i $composeDir/config/influx-configs.template -o $composeDir/config/influx-configs
