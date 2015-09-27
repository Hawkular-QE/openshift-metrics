# Prepare the environment (openshift master)

Add cluster-admin right to test user1.  We will use `oc` client command to verify data collecting in Hawkular Metrics
```
oadm policy add-cluster-role-to-user cluster-admin user1
```
Install jq (`yum install jq`) to help with json processing

# Useful commands

Log in openshift master
```
oc login --insecure-skip-tls-verify  # user1
```
Fetch Metric definitions 
```
curl -H "Hawkular-Tenant:heapster" -o defs.json http://${metrics_service_endpoint}/hawkular/metrics/metrics
```
Get Metric IDs
```
cat defs.json | jq '.[]  .id'
```
Get all projects
```
# openshift
oc get projects --no-headers | awk '{print $1}'

# hawuklar
cat defs.json | jq -r 'unique_by(.tags.pod_namespace) [].tags.pod_namespace'
```
Get all pods 
```
# openshift
oc get nodes
oadm manage-node <node name> --list-pods

# hawkular
cat defs.json | jq -r 'unique_by(.tags.pod_name) [].tags.pod_name'
