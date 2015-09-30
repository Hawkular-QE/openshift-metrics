# Deploy Influxdb + Granafa
Once you have Hawkular-Metrics running you may want to deploy an alternative monitoring tool to verify Hawkular data.

Check [openshift docs](https://docs.openshift.org/latest/admin_guide/cluster_metrics.html) for more recent update.
```
# oc new-project <name your project>

# you only need to run this once
# oadm policy add-cluster-role-to-user     cluster-reader     system:serviceaccount:default:heapster

# oc create -f .
```
