#!/bin/bash


BASE_URL='http://hawkular-metrics-default.cloud.jonqe.lab.eng.bos.redhat.com/hawkular/metrics'
HEADERS=(-H "Content-type: application/json" -H "Hawkular-Tenant:heapster")

POD_UID=$(oc get pod -o template -l "name=hawkular-metrics"  --template='{{(index .items 0).metadata.uid}}')
echo "Pod uid: ${POD_UID}"
METRICS_ID=gauges/hawkular-metrics%2F${POD_UID}%2Fcpu%2Fusage

URL=${BASE_URL}/${METRICS_ID}
echo url $URL
curl "${HEADERS[@]}" ${URL}/data?buckets=8&bucketDuration=3600000 | python -m json.tool

