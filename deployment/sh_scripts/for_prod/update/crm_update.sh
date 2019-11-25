#!/bin/sh

fuser -k 9002/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/crm/redshift-ms-crm-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-crm-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/crm

cd crm
echo "starting crm"
nohup java -Xmx512m -jar redshift-ms-crm-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "crm started"
echo "-----------"
cd ..
