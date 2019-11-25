cd /data/all_bll_services/

cd bll
echo "starting bll"
nohup java -Xmx1024m -jar redshift-bll-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "bll started"
echo "-----------"
cd ..

cd ec
echo "starting ec"
nohup java -Xmx512m -jar redshift-ms-ec-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "ec started"
echo "-----------"
cd ..

cd gateway
echo "starting gateway"
nohup java -Xmx512m -jar redshift-ms-gateway-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "gateway started"
echo "-----------"
cd ..

cd profiledb
echo "starting profiledb"
nohup java -Xmx512m -jar redshift-ms-profiledb-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "profiledb started"
echo "-----------"
cd ..

cd smsc
echo "starting smsc"
nohup java -Xmx512m -jar redshift-ms-smsc-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "smsc started"
echo "-----------"
cd ..

cd txndb
echo "starting txndb"
nohup java -Xmx512m -jar redshift-ms-transactiondb-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "txndb started"
echo "-----------"
cd ..

cd cbs
echo "starting cbs"
nohup java -Xmx512m -jar redshift-ms-cbs-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "cbs started"
echo "-----------"
cd ..

cd crm
echo "starting crm"
nohup java -Xmx512m -jar redshift-ms-crm-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "crm started"
echo "-----------"
cd ..

cd ups
echo "starting ups"
nohup java -Xmx512m -jar redshift-ms-ups-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "ups started"
echo "-----------"
cd ..

cd sts
echo "starting sts"
nohup java -Xmx512m -jar redshift-ms-sts-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "sts started"
echo "-----------"
cd ..

cd cbvmp
echo "starting cbvmp"
nohup java -Xmx512m -jar redshift-ms-cbvmp-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "cbvmp started"
echo "-----------"
cd ..

cd el
echo "starting el"
nohup java -Xmx512m -jar redshift-el-rs-0.0.1-SNAPSHOT.jar --spring.profiles.active=test,robi >/dev/null 2>&1 &
echo "el started"
echo "-----------"