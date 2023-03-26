### Simple bastion/jump host
Example ssh config:  
```
Host bastion
	HostName <bastion ip from output>
	IdentityFile <path to key>
	User ubuntu

Host web
	HostName <web instance ip from output>
	IdentityFile <path to key>
	Port 22
	User ubuntu
	ProxyCommand ssh -q -W %h:%p bastion
```
Simple setup. One, pre-existing key pair used. Additional security measures (like no login on bastion host) could easily be added.  
For testing, ssh into web and run:  
```
echo "Hey updated!" > /var/www/html/index.nginx-debian.html
systemctl restart nginx
```
Go to the DNS address and see that the page has been updated.