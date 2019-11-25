#!/bin/sh

fuser -k 9005/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/ec/redshift-ms-ec-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-ec-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/ec

cd ec
echo "starting ec"
nohup java -Xmx512m -jar redshift-ms-ec-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "ec started"
echo "-----------"
cd ..
