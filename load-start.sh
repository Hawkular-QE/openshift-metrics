#!/bin/bash
PROJECT_PREFIX=load-project
for i in `seq 1 18`;
do
   project=${PROJECT_PREFIX}$i
   oc new-project $project
   oc create -f test/stress1.yml
   sleep 30
done  
