#!/bin/sh

fuser -k 9007/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/gateway/redshift-ms-gateway-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-gateway-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/gateway

cd gateway
echo "starting gateway"
nohup java -Xmx512m -jar redshift-ms-gateway-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "gateway started"
echo "-----------"
cd ..
