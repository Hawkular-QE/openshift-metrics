#!/bin/bash
# Get Hawkular Metrics Pod cpu usage

. ./env

POD_UID=$(oc get pod -o template -l "name=hawkular-metrics"  --template='{{(index .items 0).metadata.uid}}')
echo "Pod uid: ${POD_UID}"
METRICS_ID=gauges/hawkular-metrics%2F${POD_UID}%2Fcpu%2Fusage
TENANT="openshift-infra"

TOKEN=$(oc whoami -t)

URL=${METRICS_ENDPOINT}/${METRICS_ID}
echo url "$URL"

dur=60000
curl -k -o output/hawkular-metrics-cpu.json -H "Authorization: Bearer ${TOKEN}" -H "hawkular-tenant: ${TENANT}" -i "${HEADERS[@]}" ${URL}/data?buckets=480&bucketDuration=$dur 
