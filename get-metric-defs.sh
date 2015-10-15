#!/bin/bash
# Get all metric definitions and save the data for offline processing

. ./env
OUTPUT=output/metrics-defs.json
TOKEN=$(oc whoami -t)
TENANT="metrics"

curl -H "Authorization: Bearer ${TOKEN}" -H "hawkular-tenant: ${TENANT}" "${HEADERS[@]}" -X GET ${METRICS_ENDPOINT}/metrics | python -m json.tool > $OUTPUT
echo "Saved to $OUTPUT"
echo "..."
tail -10 $OUTPUT
