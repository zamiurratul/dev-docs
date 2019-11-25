#!/bin/sh

fuser -k 9010/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/profiledb/redshift-ms-profiledb-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-profiledb-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/profiledb

cd profiledb
echo "starting profiledb"
nohup java -Xmx512m -jar redshift-ms-profiledb-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "profiledb started"
echo "-----------"
cd ..
