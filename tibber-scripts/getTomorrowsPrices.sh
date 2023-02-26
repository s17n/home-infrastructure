#!/bin/sh

TIBBER_ACCESS_TOKEN="${TIBBER_ACCESS_TOKEN}"
TIBBER_DOWNLOAD_DIR="${TIBBER_DOWNLOAD_DIR}"

tibber_data=$(curl -s \
-H "Authorization: Bearer $TIBBER_ACCESS_TOKEN" \
-H "Content-Type: application/json" \
-X POST \
-d  '{"query":"{ viewer{ homes { currentSubscription { priceInfo { tomorrow { startsAt total } } } } } }"}' https://api.tibber.com/v1-beta/gql )

timestamp=$(date "+%Y%m%d_%H%M%S")

executionTimestamp=$(date "+%Y%m%d-%H%M%S")
filename=$executionTimestamp"_priceinfo.json"
#echo "filename: $filename"

echo $tibber_data > "$TIBBER_DOWNLOAD_DIR/$filename"
