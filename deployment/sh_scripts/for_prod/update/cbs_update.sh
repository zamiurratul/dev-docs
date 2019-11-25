#!/bin/sh

fuser -k 9001/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/cbs/redshift-ms-cbs-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-cbs-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/cbs

cd cbs
echo "starting cbs"
nohup java -Xmx512m -jar redshift-ms-cbs-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "cbs started"
echo "-----------"
cd ..
