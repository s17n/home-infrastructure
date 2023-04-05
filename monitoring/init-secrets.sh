#!/bin/sh

composeDir="$(dirname $0)"

op inject -f -i $composeDir/alertmanager/alertmanager-template.yml -o $composeDir/alertmanager/alertmanager.yml
