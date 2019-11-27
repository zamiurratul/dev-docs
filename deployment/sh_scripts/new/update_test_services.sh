#!/bin/sh

port=0
file_name="unknown"
jar_version="0.0.1"
services=( "$@" )
deployment_profile="test"
parent_dir="data01/all_services"

assignPort() {
	if [ $1 == "bll" ]
	then
		port=9000
	elif [ $1 == "cbs" ]
	then
		port=9001
	elif [ $1 == "crm" ]
	then
		port=9002
	elif [ $1 == "sts" ]
	then
		port=9003
	elif [ $1 == "cbvmp" ]
	then
		port=9004
	elif [ $1 == "ec" ]
	then
		port=9005
	elif [ $1 == "ups" ]
	then
		port=9006
	elif [ $1 == "gateway" ]
	then
		port=9007
	elif [ $1 == "smsc" ]
	then
		port=9008
	elif [ $1 == "txndb" ]
	then
		port=9009
	elif [ $1 == "profiledb" ]
	then
		port=9010
	elif [ $1 == "el" ]
	then
		port=9011
	else
		port=0
	fi
}

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

startService() {
	ms_name=$1
	ms_port=$2
	ms_file_name=$3
		
	#stop_service
	fuser -k $ms_port/tcp

	#create_backup_directory
	mkdir -p /$parent_dir/$ms_name/backup

	#delete_old_backup_if_exists
	rm -rf /$parent_dir/$ms_name/backup/*

	#take_backup
	cp -fv /$parent_dir/$ms_name/$ms_file_name /$parent_dir/$ms_name/backup

	#remove_current
	rm -rf /$parent_dir/$ms_name/$ms_file_name

	#copy_new
	cp -fv /data/jars/$ms_file_name /$parent_dir/$ms_name

	#start_service
	cd /$parent_dir/$ms_name
	echo "running $ms in port $port of build $file_name"
	if [ $ms_name == "bll" ] 
	then 
		nohup java -Xmx1024m -jar $ms_file_name --spring.profiles.active=$deployment_profile,robi >/dev/null 2>&1 &
	else
		nohup java -Xmx512m -jar $ms_file_name --spring.profiles.active=$deployment_profile,robi >/dev/null 2>&1 &
	fi 
	cd ..
}

for ms in "${services[@]}"
do
	assignPort $ms
	assignMicroserviceFileName $ms
	if [ $port != 0 ] && [ $file_name != "unknown" ]
	then 
		startService $ms $port $file_name
	else
		echo "failed to run $ms in port $port of build $file_name"
	fi 
done
