#! /bin/bash

docker tag hpreston/myhero_app:latest $1/myhero/app:latest
docker push $1/myhero/app:latest
docker tag hpreston/myhero_ui:latest $1/myhero/ui:latest
docker push $1/myhero/ui:latest
docker tag hpreston/myhero_data:latest $1/myhero/data:latest
docker push $1/myhero/data:latest
docker tag hpreston/myhero_ernst:latest $1/myhero/ernst:latest
docker push $1/myhero/ernst:latest
docker tag matteocollina/mosca:latest $1/myhero/mosca:latest
docker push $1/myhero/mosca:latest