#!/bin/sh

fuser -k 9003/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/sts/redshift-ms-sts-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-sts-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/sts

cd sts
echo "starting sts"
nohup java -Xmx512m -jar redshift-ms-sts-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "sts started"
echo "-----------"
cd ..
