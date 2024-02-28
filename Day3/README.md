# Day 3
## In case you haven't cloned the github repo already ( do this in workstation machine )
```
cd /root
git clone https://github.com/tektutor/chef-feb-2024.git
```

## Lab - Installing mysql using cookbook
```
cd /root/chef-feb-2024
git pull

cd Day3/cookbooks
knife cookbook upload mysql --cookbook-path=.
knife cookbook list
knife node run_list add rhel-chef-node "recipe[mysql]"
knife node show rhel-chel-node 
```

Expected output
<pre>
[root@rhel-chef-workstation mysql]# knife node show rhel-chef-node
Node Name:   rhel-chef-node
Environment: _default
FQDN:        rhel-chef-node
IP:          172.20.10.10
Run List:    recipe[mysql], recipe[wordpress], recipe[httpd]
Roles:       
Recipes:     mysql, mysql::default, wordpress, wordpress::default, httpd, httpd::default, wordpress::configure-mysql-server-on-redhat, wordpress::install-wordpress, wordpress::configure-wordpress-with-mysql-credentials
Platform:    redhat 8.9
Tags:          
</pre>
