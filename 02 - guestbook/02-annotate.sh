#! /bin/bash

echo "Annotating Guestbook Sample Application"

sed -e "s/<PROVIDE_ACI_TENANT>/$1/" annotate_template.yaml > annotate_ready.yaml

kubectl apply -f annotate_ready.yaml -n guestbook
