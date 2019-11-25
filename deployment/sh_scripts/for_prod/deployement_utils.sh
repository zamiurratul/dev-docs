#!/bin/sh

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
		file_name="redshift-bll-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "cbs" ]
	then
		file_name="redshift-ms-cbs-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "crm" ]
	then
		file_name="redshift-ms-crm-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "sts" ]
	then
		file_name="redshift-ms-sts-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "cbvmp" ]
	then
		file_name="redshift-ms-cbvmp-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "ec" ]
	then
		file_name="redshift-ms-ec-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "ups" ]
	then
		file_name="redshift-ms-ups-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "gateway" ]
	then
		file_name="redshift-ms-gateway-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "smsc" ]
	then
		file_name="redshift-ms-smsc-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "txndb" ]
	then
		file_name="redshift-ms-transactiondb-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "profiledb" ]
	then
		file_name="redshift-ms-profiledb-rs-0.0.1-SNAPSHOT.jar"
	elif [ $1 == "el" ]
	then
		file_name="redshift-el-rs-0.0.1-SNAPSHOT.jar"
	else
		file_name="unknown_file_name"
	fi
}