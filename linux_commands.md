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

