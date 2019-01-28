#! /bin/bash

echo "Installing the MyHero Sample Application"

kubectl create namespace dev

sed -e "s/<PROVIDE_ACI_TENANT>/$1/" -e "s/<PROVIDE_HARBOR_IP>/$2/" myhero_app_template.yaml > myhero_app_ready.yaml
sed -e "s/<PROVIDE_ACI_TENANT>/$1/" -e "s/<PROVIDE_HARBOR_IP>/$2/" myhero_mosca_template.yaml > myhero_mosca_ready.yaml
sed -e "s/<PROVIDE_ACI_TENANT>/$1/" -e "s/<PROVIDE_HARBOR_IP>/$2/" myhero_ernst_template.yaml > myhero_ernst_ready.yaml
sed -e "s/<PROVIDE_ACI_TENANT>/$1/" -e "s/<PROVIDE_HARBOR_IP>/$2/" myhero_data_template.yaml > myhero_data_ready.yaml


kubectl apply -f myhero_data_ready.yaml -n dev
kubectl apply -f myhero_mosca_ready.yaml -n dev
kubectl apply -f myhero_ernst_ready.yaml -n dev
kubectl apply -f myhero_app_ready.yaml -n dev

MYHERO_APP_EXTERNAL_IP=$(kubectl -n dev get services myhero-app -o json | python -c 'import sys, json; print json.load(sys.stdin)["status"]["loadBalancer"]["ingress"][0]["ip"]')
sed -e "s/<PROVIDE-EXTERNAL-IP-FOR-myhero-app>/${MYHERO_APP_EXTERNAL_IP}/" -e "s/<PROVIDE_ACI_TENANT>/$1/" -e "s/<PROVIDE_HARBOR_IP>/$2/" myhero_ui_template.yaml > myhero_ui_ready.yaml

kubectl apply -f myhero_ui_ready.yaml -n dev