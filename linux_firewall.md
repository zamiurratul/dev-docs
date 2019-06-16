## UFW - Uncomplicated Firewal

### enable / disable
`ufw enable`  
`ufw disable`

### status
`ufw status`  
`ufw status verbose`  

### list
`ufw app list`

### allow an app
`ufw allow OpenSSH`

###  block an ip address
To block all network connections that originate from a specific IP address, 15.15.15.51 for example, run this command:  
`ufw deny from 15.15.15.51`

###  block connections to a network interface
To block connections from a specific IP address, e.g. 15.15.15.51, to a specific network interface, e.g. eth0, use this command:  
`ufw deny in on eth0 from 15.15.15.51`

### SERVICE: ssh 

#### allow all incoming ssh connections
`ufw allow ssh`

#### allow all incoming ssh connections by port number
`ufw allow 22`

#### allow incoming ssh from specific ip address or subnet
To allow incoming SSH connections from a specific IP address or subnet, specify the source. For example, if you want to allow the entire 15.15.15.0/24 subnet, run this command:  
`sudo ufw allow from 15.15.15.0/24  to any port 22`

### SERVICE: web server 

#### allow all incoming http
`ufw allow http`  
`ufw allow 80`

#### allow all incoming https
`ufw allow https`  
`ufw allow 443`

#### allow all incoming http and https
If you want to allow both HTTP and HTTPS traffic, you can create a single rule that allows both ports. To allow all incoming HTTP and HTTPS (port 443) connections run this command:  
`ufw allow proto tcp from any to any port 80,443`

TIP: opposite of allow is deny