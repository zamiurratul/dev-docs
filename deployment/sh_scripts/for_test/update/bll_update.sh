#!/bin/sh

fuser -k 9000/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/bll/redshift-bll-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-bll-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/bll

cd bll
echo "starting bll"
nohup java -Xmx1024m -jar redshift-bll-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "bll started"
echo "-----------"
cd ..
