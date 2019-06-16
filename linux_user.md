## systemstl

### add a user
`adduser ratul`

### del a user
`userdel [username]`  
`userdel ratul`  
`userdel [options] [username]`  
`userdel -r ratul`  

* -f : Delete Linux user account with force removal of files
* -r : Remove Linux user account including home directory and mail spool

### add a user to sudo group
`usermod -aG sudo ratul`