### check listing ports
`netstat -tulpn | grep LISTEN`

### kill a process in a specified ports
`fuser -k [port_number]/tcp`

### run java jar
`java -jar [jar_location_with_name]`

### start a service
`service [service_name] start`

### stop a service
`service [service_name] stop`

### change permission of a service script
`chmod u+x /etc/init.d/upsservice`

### create a script
`nano upsservice`

### login as super user
`su -`

### change ownership of a file
`chown appadmin:appadmin /etc/init.d/upsservice`

### targz a file
`tar -zcvf bll_deployment.tar.gz bll_deployment`

### extract targz file
`tar -xf bll_deployment.tar.gz`

### find files under a directory
`find . -name *ff8819cc-22bd-49eb-9220-e0c923*.txt`

### copy file
`cp -p /data/ff8819cc-22bd-49eb-9220-e0c923_1580220067492.txt /data/files/`

