#!/bin/bash
. ./env
curl -s "${HEADERS[@]}" ${METRICS_ENDPOINT}/metrics | python -m json.tool > output/metrics-defs.json
