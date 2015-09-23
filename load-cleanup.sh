#!/bin/bash
if [ "$1" != "-f" ]; then
   echo "Warning! This script will forcefully delete load projects. Provide -f to proceed."
   exit 0
fi
oc get --no-headers projects | awk '/load-project.*/ { print $1 }' | xargs --no-run-if-empty oc delete project
