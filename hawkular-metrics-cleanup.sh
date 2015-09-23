#!/bin/bash
# Utility script to delete Hawkular Metrics related resources from Openshift.
# Usefuly for cleaning up a bad deployment.  Must be in the project where
# Hawkular Metrics is running

if [ "$1" != "-f" ]; then
   echo "Warning! This script will forcefully delete hawkular-metrics. Provide -f to proceed."
   exit 0
fi

oc delete rc hawkular-cassandra hawkular-metrics heapster

oc delete services hawkular-cassandra hawkular-cassandra-nodes hawkular-metrics heapster

oc delete endpoints hawkular-cassandra hawkular-cassandra-nodes hawkular-metrics heapster

oc delete sa hawkular

oc delete route hawkular-metrics heapster

exit 0

