#!/bin/bash

for i in "$@"
do
case $i in
    -a=*|--account=*)
    ACCOUNT="${i#*=}"
    ;;
    -init|--init-secrets)
    INIT_SECRETS=YES
    ;;
    -start)
    START=YES
    ;;
    -stop)
    STOP=YES
    ;;
    -h|--help)
    HELP=YES
    ;;
    *)
            # unknown option
    ;;
esac
done

declare -a start_services=(logging monitoring traefik adguardhome influxdb2 mosquitto portainer node-exporter homebridge tibber-bridge grafana webdav unifi-controller)

declare -a stop_services=(unifi-controller webdav grafana tibber-bridge homebridge node-exporter portainer mosquitto influxdb2 adguardhome traefik monitoring logging)

projectDir="$(dirname "$0")/.."

function initSecrets {

   output=$(op whoami)
   lcec=$?; if [ "$lcec" -gt "0" ]; then 
      echo "Command 'op whoami' exists with exit code > 0. Please check your're logged in at 1Password CLI."
      exit 0
   fi

   for service in "${start_services[@]}"
   do
      if [ -f $projectDir/$service/init-secrets.sh ];
      then
         echo "Found & executing init-secrets.sh for: $service "
         $projectDir/$service/init-secrets.sh
         if [ "$?" -gt "0" ]; then
            echo "Error init-secrets for service: $service"
         fi 
      fi
   done

}

function startServices {

   docker network create monitoring
   docker network create reverse-proxy

   for service in "${start_services[@]}"
   do
      docker compose -f $projectDir/$service/docker-compose.yml up -d
   done
}

function stopServices {

   for service in "${stop_services[@]}"
   do
      docker compose -f $projectDir/$service/docker-compose.yml down
   done

   docker network rm reverse-proxy
   docker network rm monitoring
}

if [ $INIT_SECRETS ]; then
   initSecrets
fi

if [ $START ]; then
   startServices
fi

if [ $STOP ]; then
   stopServices
fi
