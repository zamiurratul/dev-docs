#### check status
`systemctl status firewalld.service`

#### enable
`systemctl enable firewalld.service`

#### start
`systemctl start firewalld.service`

#### restart
`systemctl restart firewalld`

#### open port for public use
`firewall-cmd --zone=public --permanent --add-port=PORT/tcp`

#### close port
`firewall-cmd --zone=public --permanent --remove-port=PORT/tcp`

#### reload firewalld
`firewall-cmd --reload`

#### list all open ports
`firewall-cmd --list-ports`

#### list all configs
`firewall-cmd --list-all`

#### list services that have opened ports
`firewall-cmd --list-services`

#### enable all the incoming ports for a service
`firewall-cmd --zone=public --add-service=http`

