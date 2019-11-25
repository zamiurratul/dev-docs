#!/bin/sh

fuser -k 9004/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/cbvmp/redshift-ms-cbvmp-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-cbvmp-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/cbvmp

cd cbvmp
echo "starting cbvmp"
nohup java -Xmx512m -jar redshift-ms-cbvmp-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "cbvmp started"
echo "-----------"
cd ..
