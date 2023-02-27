#!/bin/zsh
# usage: ./getHistoricalConsumptionData.sh 2023-02-25T21

TIBBER_ACCESS_TOKEN="${TIBBER_ACCESS_TOKEN}"
TIBBER_DOWNLOAD_DIR="${TIBBER_DOWNLOAD_DIR}"

afterParam=$1

afterValueAsString="$afterParam:00:00.000+01:00"
#afterValueAsString="2023-02-15T12:00:00.000+01:00"
#echo "afterValueAsString: $afterValueAsString"

afterValueAsBase64=`echo -n $afterValueAsString|base64`
#afterValueAsBase64="MjAyMy0wMi0xNVQwOTowMDowMC4wMDArMDE6MDA="
#echo "afterValueAsBase64: $afterValueAsBase64"

scriptDir=`dirname "$0"`
queryFromFile=$(cat $scriptDir/tibber_query_01.ql)
#echo $queryFromFile

queryString=`echo ${queryFromFile/AFTER_VALUE/"$afterValueAsBase64"}`
#echo $queryString

CURL_D_PARAM="{\"query\":\"$queryString\"}"
#echo "curl -d parameter is: $CURL_D_PARAM" 

consumptionData=`curl \
-H "Authorization: Bearer $TIBBER_ACCESS_TOKEN" \
-H "Content-Type: application/json" \
-X POST \
-d "$CURL_D_PARAM" \
https://api.tibber.com/v1-beta/gql`

executionTimestamp=$(date "+%Y%m%d-%H%M%S")
filename=$afterParam"_consumption_"$executionTimestamp".json"
#echo "filename: $filename"

echo $consumptionData > "$TIBBER_DOWNLOAD_DIR/$filename"
#echo "consumptionData: $consumptionData"