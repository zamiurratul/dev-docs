## Remote Debug for Spring Boot

`nohup java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=10.101.65.110:8787 -jar redshift-bll-rs-0.0.1-SNAPSHOT.jar &`