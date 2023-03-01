#!/bin/bash

tibberAccessToken="${TIBBER_ACCESS_TOKEN}"
tibberDownloadDir="${TIBBER_DOWNLOAD_DIR}"

scriptDir=`dirname "$0"`
queryString=$(cat $scriptDir/tibber_query_03.ql)
#echo "queryString: $queryString" >> /etc/tibber/bin/debug.log

CURL_D_PARAM="{\"query\":\"$queryString\"}"
#echo "curl -d parameter is: $CURL_D_PARAM" >> /etc/tibber/bin/debug.log 

tibberData=`curl \
-H "Authorization: Bearer $tibberAccessToken" \
-H "Content-Type: application/json" \
-X POST \
-d "$CURL_D_PARAM" \
https://api.tibber.com/v1-beta/gql`

timestamp=$(date "+%Y%m%d_%H%M%S")

executionTimestamp=$(date "+%Y%m%d-%H%M%S")
filename=$executionTimestamp"_priceinfo.json"
#echo "filename: $filename"

echo $tibberData > "$tibberDownloadDir/$filename"
