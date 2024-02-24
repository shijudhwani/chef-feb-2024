# chef-feb-2024

## Installing Chef Workstation
https://docs.chef.io/workstation/install_workstation/

## Installing Chef Server
https://docs.chef.io/server/install_server/

## Installing Chef Node


## Installing Ruby 3 from source code on Chef Server
```
cd ~/Downloads
wget https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.2.tar.gz
tar xvfz ruby-3.0.2.tar.gz

sudo yum groupinstall development tools

```

## Installing Chef Server in RHEL 9.3
```

```


## Configuring chef server ip in windows node
```
C:\Windows\system32\drivers\etc\host file
```

## Need to enable winrm in windows machine in Powershell
```
winrm quickconfig
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
```

## Bootstrapping RHEL Chef Nodes
```
knife bootstrap rhel-chef-node --ssh-user root --ssh-password admin@123 --node-name rhel-chef-node
```

## Bootstrapping Windows Chef Nodes
```
knife boostrap windows-chef-node -o winrm -U Administrator -P admin@123 --node-name windows-chef-node -p 5985`
```
