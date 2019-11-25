#!/bin/sh

fuser -k 9008/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/smsc/redshift-ms-smsc-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-smsc-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/smsc

cd smsc
echo "starting smsc"
nohup java -Xmx512m -jar redshift-ms-smsc-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "smsc started"
echo "-----------"
cd ..
