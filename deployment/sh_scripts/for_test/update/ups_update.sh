#!/bin/sh

fuser -k 9006/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/ups/redshift-ms-ups-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-ups-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/ups

cd ups
echo "starting ups"
nohup java -Xmx512m -jar redshift-ms-ups-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "ups started"
echo "-----------"
cd ..
