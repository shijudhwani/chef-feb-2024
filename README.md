# chef-feb-2024

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
