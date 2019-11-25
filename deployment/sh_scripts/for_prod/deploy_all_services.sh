#!/bin/sh

fuser -k 9000/tcp
fuser -k 9001/tcp
fuser -k 9002/tcp
fuser -k 9003/tcp
fuser -k 9004/tcp
fuser -k 9005/tcp
fuser -k 9006/tcp
fuser -k 9007/tcp
fuser -k 9008/tcp
fuser -k 9009/tcp
fuser -k 9010/tcp
fuser -k 9011/tcp

cd /data

mkdir -p all_bll_services

cd all_bll_services

mkdir -p bll ec gateway profiledb smsc txndb cbs crm ups sts cbvmp el

cp -fv /data/jars/redshift-bll-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/bll
cp -fv /data/jars/redshift-ms-ec-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/ec
cp -fv /data/jars/redshift-ms-gateway-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/gateway
cp -fv /data/jars/redshift-ms-profiledb-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/profiledb
cp -fv /data/jars/redshift-ms-smsc-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/smsc
cp -fv /data/jars/redshift-ms-transactiondb-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/txndb
cp -fv /data/jars/redshift-ms-cbs-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/cbs
cp -fv /data/jars/redshift-ms-crm-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/crm
cp -fv /data/jars/redshift-ms-ups-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/ups
cp -fv /data/jars/redshift-ms-sts-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/sts
cp -fv /data/jars/redshift-ms-cbvmp-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/cbvmp
cp -fv /data/jars/redshift-el-rs-0.0.1-SNAPSHOT.jar /data/all_bll_services/el

cd bll
echo "starting bll"
nohup java -Xmx1024m -jar redshift-bll-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "bll started"
echo "-----------"
cd ..

cd ec
echo "starting ec"
nohup java -Xmx512m -jar redshift-ms-ec-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "ec started"
echo "-----------"
cd ..

cd gateway
echo "starting gateway"
nohup java -Xmx512m -jar redshift-ms-gateway-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "gateway started"
echo "-----------"
cd ..

cd profiledb
echo "starting profiledb"
nohup java -Xmx512m -jar redshift-ms-profiledb-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "profiledb started"
echo "-----------"
cd ..

cd smsc
echo "starting smsc"
nohup java -Xmx512m -jar redshift-ms-smsc-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "smsc started"
echo "-----------"
cd ..

cd txndb
echo "starting txndb"
nohup java -Xmx512m -jar redshift-ms-transactiondb-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "txndb started"
echo "-----------"
cd ..

cd cbs
echo "starting cbs"
nohup java -Xmx512m -jar redshift-ms-cbs-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "cbs started"
echo "-----------"
cd ..

cd crm
echo "starting crm"
nohup java -Xmx512m -jar redshift-ms-crm-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "crm started"
echo "-----------"
cd ..

cd ups
echo "starting ups"
nohup java -Xmx512m -jar redshift-ms-ups-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "ups started"
echo "-----------"
cd ..

cd sts
echo "starting sts"
nohup java -Xmx512m -jar redshift-ms-sts-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "sts started"
echo "-----------"
cd ..

cd cbvmp
echo "starting cbvmp"
nohup java -Xmx512m -jar redshift-ms-cbvmp-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "cbvmp started"
echo "-----------"
cd ..

cd el
echo "starting el"
nohup java -Xmx512m -jar redshift-el-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod,robi >/dev/null 2>&1 &
echo "el started"
echo "-----------"
