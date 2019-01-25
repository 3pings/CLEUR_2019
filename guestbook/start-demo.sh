#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

# hide the evidence
clear

pe "kubectl apply -f guestbook-all-in-one.yaml -n demo"

pe "kubectl apply -f annotate.yaml -n demo --overwrite"

pe "kubectl get namespaces --show-labels"

pe "kubectl --namespace=demo scale demployment frontend --replicas=20"