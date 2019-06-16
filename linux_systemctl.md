## systemstl

### syntax
`systemctl [OPTION] [SERVICE]`

### start / stop
`sudo systemctl start mysql.service`  
`sudo systemctl stop mysql.service`  

### restart / reload
`sudo systemctl reload mysql.service`  
`sudo systemctl restart mysql.service`  

### status
`sudo systemctl status mysql.service`

### enable / disable
`sudo systemctl enable mysql.service`  
`sudo systemctl disable mysql.service`  

### check if is-enabled / is-disabled
`sudo systemctl is-active mysql.service`  
`sudo systemctl is-enabled mysql.service`  