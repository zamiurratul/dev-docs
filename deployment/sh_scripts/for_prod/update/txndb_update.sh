#!/bin/sh

fuser -k 9009/tcp

cd /data/all_bll_services

rm -fr /data/all_bll_services/txndb/redshift-ms-transactiondb-rs-0.0.1-SNAPSHOT.jar

cp -fv /data/jars/redshift-ms-transactiondb-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/txndb

cd txndb
echo "starting txndb"
nohup java -Xmx512m -jar redshift-ms-transactiondb-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "txndb started"
echo "-----------"
cd ..
