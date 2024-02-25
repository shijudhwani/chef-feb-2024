# Day 1

## Lab - Writing your Chef first cookbook 

### Chef Workstation Machine
```
chef generate cookbook first-cookbook
```

Under first-cookbook folder edit recipes/default.rb as shown below as save it
```
log 'message' do
  message 'Hello Cookbook!'
  level :info
end
```

Now let's upload the cookbook to Chef Server
```
knife cookbook upload first-cookbook --cookbook-path=.
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife cookbook upload first-cookbook --cookbook-path=.
Uploading first-cookbook [0.1.0]
Uploaded 1 cookbook.  
</pre>

List the cookbooks available in Chef server from Chef workstation machine
```
knife cookbook list
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife cookbook list
first-cookbook   0.1.0  
</pre>

## Running the chef-client convergence on RHEL Chef node
```
knife ssh 'name:rhel-chef-node' 'sudo chef-client' -x root
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife ssh 'name:rhel-chef-node' 'sudo chef-client' -x root
root@rhel-chef-node's password:
rhel-chef-node Chef Infra Client, version 17.10.114
rhel-chef-node Patents: https://www.chef.io/patents
rhel-chef-node Infra Phase starting
rhel-chef-node Resolving cookbooks for run list: ["first-cookbook"]
rhel-chef-node Synchronizing cookbooks:
rhel-chef-node   - first-cookbook (0.1.0)
rhel-chef-node Installing cookbook gem dependencies:
rhel-chef-node Compiling cookbooks...
rhel-chef-node Loading Chef InSpec profile files:
rhel-chef-node Loading Chef InSpec input files:
rhel-chef-node Loading Chef InSpec waiver files:
rhel-chef-node Converging 1 resources
rhel-chef-node Recipe: first-cookbook::default
rhel-chef-node   * log[message] action write
rhel-chef-node 
rhel-chef-node Running handlers:
rhel-chef-node Running handlers complete
rhel-chef-node Infra Phase complete, 0/1 resources updated in 03 seconds 
</pre>


### Running the convergence on Window nodes
```
knife winrm 'windows-chef-node' 'chef-client -c c:/chef/client.rb' -m -x Administrator -P admin@123
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife winrm 'windows-chef-node' 'chef-client -c c:/chef/client.rb' -m -x Administrator -P admin@123
windows-chef-node Chef Infra Client, version 17.10.114
windows-chef-node 
windows-chef-node Patents: https://www.chef.io/patents
windows-chef-node Infra Phase starting
windows-chef-node Resolving cookbooks for run list: ["first-cookbook"]
windows-chef-node 
windows-chef-node Synchronizing cookbooks:
windows-chef-node 
windows-chef-node   
windows-chef-node - first-cookbook (0.1.0)
windows-chef-node Installing cookbook gem dependencies:
windows-chef-node Compiling cookbooks...
windows-chef-node Loading Chef InSpec profile files:
windows-chef-node 
windows-chef-node Loading Chef InSpec input files:
windows-chef-node Loading Chef InSpec waiver files:
windows-chef-node Converging 1 resources
windows-chef-node 
windows-chef-node Recipe: first-cookbook::default
windows-chef-node   * log[message] action write
windows-chef-node 
windows-chef-node 
windows-chef-node Running handlers:
windows-chef-node Running handlers complete
windows-chef-node Infra Phase complete, 0/1 resources updated in 08 seconds  
</pre>
