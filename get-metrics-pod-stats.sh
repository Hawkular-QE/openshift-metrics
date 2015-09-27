#!/bin/bash
# Get Hawkular Metrics Pod cpu usage

. ./env

POD_UID=$(oc get pod -o template -l "name=hawkular-metrics"  --template='{{(index .items 0).metadata.uid}}')
echo "Pod uid: ${POD_UID}"
METRICS_ID=gauges/hawkular-metrics%2F${POD_UID}%2Fcpu%2Fusage

URL=${METRICS_ENDPOINT}/${METRICS_ID}
echo url "$URL"

dur=60000
curl -o output/hawkular-metrics-cpu.json -i "${HEADERS[@]}" ${URL}/data?buckets=480&bucketDuration=$dur 
