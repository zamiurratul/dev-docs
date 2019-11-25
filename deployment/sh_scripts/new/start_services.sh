#!/bin/sh

file_name="unknown"
jar_version="0.0.1"
services=( "$@" )

assignMicroserviceFileName() {
	if [ $1 == "bll" ]
	then
		file_name="redshift-bll-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "cbs" ]
	then
		file_name="redshift-ms-cbs-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "crm" ]
	then
		file_name="redshift-ms-crm-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "sts" ]
	then
		file_name="redshift-ms-sts-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "cbvmp" ]
	then
		file_name="redshift-ms-cbvmp-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "ec" ]
	then
		file_name="redshift-ms-ec-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "ups" ]
	then
		file_name="redshift-ms-ups-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "gateway" ]
	then
		file_name="redshift-ms-gateway-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "smsc" ]
	then
		file_name="redshift-ms-smsc-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "txndb" ]
	then
		file_name="redshift-ms-transactiondb-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "profiledb" ]
	then
		file_name="redshift-ms-profiledb-rs-$jar_version-SNAPSHOT.jar"
	elif [ $1 == "el" ]
	then
		file_name="redshift-el-rs-$jar_version-SNAPSHOT.jar"
	else
		file_name="unknown"
	fi
}

cd /data/all_bll_services/

for ms in "${services[@]}"
do
	cd $ms
	assignMicroserviceFileName $ms
	if [ $file_name != "unknown" ]
	then
		echo "starting $ms"
		if [ $ms == "bll" ]
		then
			nohup java -Xmx1024m -jar $file_name --spring.profiles.active=prod,robi >/dev/null 2>&1 &
		else
			nohup java -Xmx512m -jar $file_name --spring.profiles.active=prod,robi >/dev/null 2>&1 &
		then
		fi
	else
	then
		echo "failed to start $ms because file name $file_name"
	fi
	echo "-----------"
	cd .. 
done