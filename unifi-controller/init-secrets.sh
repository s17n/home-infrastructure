#!/bin/sh

composeDir="$(dirname $0)"

op inject -f -i $composeDir/.secrets.template.env -o $composeDir/.secrets.env
