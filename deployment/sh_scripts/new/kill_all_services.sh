#!/bin/sh

for port in {9000..9012}
do
	echo "killing service in port $port"
	fuser -k $port/tcp
done