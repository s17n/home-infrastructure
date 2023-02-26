#!/bin/sh

TIBBER_ACCESS_TOKEN="${TIBBER_ACCESS_TOKEN}"

queryString=`cat /etc/tibber/bin/tibber_query_02.ql`
#echo "queryString: $queryString" >> /etc/tibber/bin/debug.log

CURL_D_PARAM="{\"query\":\"$queryString\"}"
#echo "curl -d parameter is: $CURL_D_PARAM" >> /etc/tibber/bin/debug.log 

consumptionData=`curl \
-H "Authorization: Bearer $TIBBER_ACCESS_TOKEN" \
-H "Content-Type: application/json" \
-X POST \
-d "$CURL_D_PARAM" \
https://api.tibber.com/v1-beta/gql`

# get timestamp of previous hour (-1 hours) - min+sec set to 00  
timestamp=$(date -d "$date -1 hours" | sed "s/:[0-9][0-9]/:00/g") # Linux
#timestamp=$(date  -v-1H | sed "s/:[0-9][0-9]/:00/g") # MacOS

day_of_week=$(date +%u)
week=$(date +%V)
# echo "timestamp: $timestamp\nday of week: $day_of_week\nweek: $week"

json="{"
json=$json" \"time\": \"$timestamp\", "
json=$json" \"day_of_week\": \"$day_of_week\", "
json=$json" \"week\": \"$week\", "
json=$json" \"tibber\": " 
json=$json"$consumptionData"
json=$json"}"

echo "$json"
#echo "$json" >> /etc/tibber/bin/debug.log
