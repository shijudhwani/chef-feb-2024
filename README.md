# Chef Feb 2024

## Please Note
<pre>
1. Chef is already installed in your lab machine, hence you don't have to do any installation
2. The instructions given below are for your reference, hence do not try this in our lab machine
</pre>

## Info - Installing Chef Server in RHEL v8.9
```
yum module list ruby
yum install @ruby:3.1
ruby --version
```

Expected output
<pre>
[root@rhel-chef-server ~]# yum module list ruby
Updating Subscription Management repositories.
Last metadata expiration check: 0:00:44 ago on Sunday 25 February 2024 12:01:18 AM IST.
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)
Name                      Stream                       Profiles                       Summary                                                                 
ruby                      2.5 [d]                      common [d]                     An interpreter of object-oriented scripting language                    
ruby                      2.6                          common [d]                     An interpreter of object-oriented scripting language                    
ruby                      2.7                          common [d]                     An interpreter of object-oriented scripting language                    
ruby                      3.0                          common [d]                     An interpreter of object-oriented scripting language                    
ruby                      3.1                          common [d]                     An interpreter of object-oriented scripting language                    

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
[root@rhel-chef-server ~]# yum install @ruby:3.1
Updating Subscription Management repositories.
Last metadata expiration check: 0:01:07 ago on Sunday 25 February 2024 12:01:18 AM IST.
Dependencies resolved.
==============================================================================================================================================================
 Package                        Architecture       Version                                                 Repository                                    Size
==============================================================================================================================================================
Installing group/module packages:
 ruby                           x86_64             3.1.2-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms              90 k
Installing dependencies:
 ruby-default-gems              noarch             3.1.2-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms              79 k
 ruby-libs                      x86_64             3.1.2-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms             3.3 M
 rubygem-io-console             x86_64             0.5.11-141.module+el8.7.0+15051+29b42f0c                rhel-8-for-x86_64-appstream-rpms              73 k
 rubygem-json                   x86_64             2.6.1-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms             100 k
 rubygem-psych                  x86_64             4.0.3-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms              99 k
Installing weak dependencies:
 rubygem-bigdecimal             x86_64             3.1.1-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms             114 k
 rubygem-bundler                noarch             2.3.7-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms             449 k
 rubygem-rdoc                   noarch             6.4.0-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms             518 k
 rubygems                       noarch             3.3.7-141.module+el8.7.0+15051+29b42f0c                 rhel-8-for-x86_64-appstream-rpms             320 k
Installing module profiles:
 ruby/common                                                                                                                                                 
Enabling module streams:
 ruby                                              3.1                                                                                                       

Transaction Summary
==============================================================================================================================================================
Install  10 Packages

Total download size: 5.1 M
Installed size: 16 M
Is this ok [y/N]: y
Downloading Packages:
(1/10): ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm                                                                29 kB/s |  90 kB     00:03    
(2/10): rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm                                                 317 kB/s | 114 kB     00:00    
(3/10): rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch.rpm                                                    827 kB/s | 449 kB     00:00    
(4/10): ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch.rpm                                                   18 kB/s |  79 kB     00:04    
(5/10): rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm                                                       269 kB/s | 100 kB     00:00    
(6/10): ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm                                                          623 kB/s | 3.3 MB     00:05    
(7/10): rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm                                                      169 kB/s |  99 kB     00:00    
(8/10): rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm                                                 21 kB/s |  73 kB     00:03    
(9/10): rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch.rpm                                                            86 kB/s | 320 kB     00:03    
(10/10): rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch.rpm                                                      128 kB/s | 518 kB     00:04    
--------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                         550 kB/s | 5.1 MB     00:09     
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)                                                                      4.9 MB/s | 5.0 kB     00:00    
Importing GPG key 0xFD431D51:
 Userid     : "Red Hat, Inc. (release key 2) <security@redhat.com>"
 Fingerprint: 567E 347A D004 4ADE 55BA 8A5F 199E 2F91 FD43 1D51
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
Is this ok [y/N]: y
Key imported successfully
Importing GPG key 0xD4082792:
 Userid     : "Red Hat, Inc. (auxiliary key) <security@redhat.com>"
 Fingerprint: 6A6A A7C9 7C88 90AE C6AE BFE2 F76F 66C3 D408 2792
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
Is this ok [y/N]: y
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                      1/1 
  Installing       : ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                            1/10 
  Installing       : rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                   2/10 
  Installing       : ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch                                                                    3/10 
  Installing       : rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                                                                      4/10 
  Installing       : rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                  5/10 
  Installing       : rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                         6/10 
  Installing       : rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                        7/10 
  Installing       : rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch                                                                         8/10 
  Installing       : rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                                                                             9/10 
  Installing       : ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                                10/10 
  Running scriptlet: ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                                10/10 
  Verifying        : ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                                 1/10 
  Verifying        : ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch                                                                    2/10 
  Verifying        : ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                            3/10 
  Verifying        : rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                   4/10 
  Verifying        : rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                                                                      5/10 
  Verifying        : rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                  6/10 
  Verifying        : rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                         7/10 
  Verifying        : rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64                                                                        8/10 
  Verifying        : rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch                                                                         9/10 
  Verifying        : rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                                                                            10/10 
Installed products updated.

Installed:
  ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                         ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch               
  ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                    rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_64              
  rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch              rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_64             
  rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64                 rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64                   
  rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch                 rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                        

Complete!
[root@rhel-chef-server ~]# ruby --version
ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
[root@rhel-chef-server ~]#   
</pre>

#### Info - Installing Chef Server
```
wget https://packages.chef.io/files/stable/chef-server/14.9.23/el/8/chef-server-core-14.9.23-1.el7.x86_64.rpm
sudo rpm -ivh ./chef-server-core-14.9.23-1.el7.x86_64.rpm
head -n1 /opt/opscode/version-manifest.txt

chef-server-ctl reconfigure
sudo chef-server-ctl status
```

Expected output
<pre>
[root@rhel-chef-server ~]# wget https://packages.chef.io/files/stable/chef-server/14.9.23/el/8/chef-server-core-14.9.23-1.el7.x86_64.rpm
--2024-02-25 00:06:23--  https://packages.chef.io/files/stable/chef-server/14.9.23/el/8/chef-server-core-14.9.23-1.el7.x86_64.rpm
Resolving packages.chef.io (packages.chef.io)... 199.232.106.110
Connecting to packages.chef.io (packages.chef.io)|199.232.106.110|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 253331464 (242M) [application/x-rpm]
Saving to: ‘chef-server-core-14.9.23-1.el7.x86_64.rpm’

chef-server-core-14.9.23-1.el7.x86_64.r 100%[=============================================================================>] 241.60M  20.0MB/s    in 21s     

2024-02-25 00:06:45 (11.8 MB/s) - ‘chef-server-core-14.9.23-1.el7.x86_64.rpm’ saved [253331464/253331464]

[root@rhel-chef-server ~]# sudo rpm -ivh ./chef-server-core-14.9.23-1.el7.x86_64.rpm
warning: ./chef-server-core-14.9.23-1.el7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 83ef826a: NOKEY
Verifying...                          ################################# [100%]
Preparing...                          ################################# [100%]
Updating / installing...
   1:chef-server-core-14.9.23-1.el7   ################################# [100%]
Thank you for installing Chef Infra Server!

Run 'chef-server-ctl reconfigure' to configure your Chef Infra Server

For more information on getting started see https://docs.chef.io/server/
  
[root@rhel-chef-server ~]# head -n1 /opt/opscode/version-manifest.txt
chef-server 14.9.23

[root@rhel-chef-server ~]# chef-server-ctl reconfigure

Documentation: https://docs.chef.io/server/
Patents:       https://www.chef.io/patents

+---------------------------------------------+
            Chef License Acceptance

Before you can continue, 3 product licenses
must be accepted. View the license at
https://www.chef.io/end-user-license-agreement/

Licenses that need accepting:
  * Chef Infra Server
  * Chef Infra Client
  * Chef InSpec

Do you accept the 3 product licenses (yes/no)?

> yes

Persisting 3 product licenses...
✔ 3 product licenses persisted.

+---------------------------------------------+
Starting Chef Infra Client, version 16.13.16
Patents: https://www.chef.io/patents
resolving cookbooks for run list: ["private-chef::default"]
Synchronizing Cookbooks:
  - enterprise (1.1.0)
  - private-chef (0.1.2)
  - runit (5.1.6)
  - packagecloud (1.0.1)
  - yum-epel (4.1.4)
Installing Cookbook Gems:
Compiling Cookbooks...
Recipe: private-chef::default
  * directory[/etc/opscode] action create (up to date)
  * directory[/etc/opscode/logrotate.d] action create
    - create new directory /etc/opscode/logrotate.d
    - change mode from '' to '0755'
    - change owner from '' to 'root'
    - change group from '' to 'root'
    - restore selinux security context
  Converging 223 resources
  * link[/usr/bin/private-chef-ctl] action create (up to date)
  * link[/usr/bin/chef-server-ctl] action create (up to date)
  * directory[/etc/opscode] action nothing (skipped due to action :nothing)
  * directory[/etc/opscode/logrotate.d] action nothing (skipped due to action :nothing)
  * log[opscode_webui deprecation notice] action write (skipped due to only_if)
Recipe: private-chef::users
  * linux_user[opscode] action create
    - create user opscode
  * group[opscode] action create
    - alter group opscode
    - replace group members with new list of members: opscode
Recipe: private-chef::private_keys
  * file[/etc/opscode/pivotal.pem] action create
    - create new file /etc/opscode/pivotal.pem
    - update content in file /etc/opscode/pivotal.pem from none to efd972
    - suppressed sensitive resource
    - change mode from '' to '0600'
    - change owner from '' to 'opscode'
    - change group from '' to 'root'
    - restore selinux security context
  * file[/etc/opscode/webui_priv.pem] action create
    - create new file /etc/opscode/webui_priv.pem
    - update content in file /etc/opscode/webui_priv.pem from none to 621522
    - suppressed sensitive resource
    - change mode from '' to '0600'
    - change owner from '' to 'opscode'
    - change group from '' to 'root'
    - restore selinux security context
Recipe: private-chef::oc_id
  * component_runit_service[oc_id] action restart
  Recipe: <Dynamically Defined Resource>
    * service[oc_id] action nothing (skipped due to action :nothing)
    * runit_service[oc_id] action restart (up to date)
     (up to date)
Recipe: private-chef::nginx
  * component_runit_service[nginx] action restart
  Recipe: <Dynamically Defined Resource>
    * service[nginx] action nothing (skipped due to action :nothing)
    * runit_service[nginx] action restart (up to date)
     (up to date)
Recipe: private-chef::elasticsearch
  * component_runit_service[elasticsearch] action restart
  Recipe: <Dynamically Defined Resource>
    * service[elasticsearch] action nothing (skipped due to action :nothing)
    * runit_service[elasticsearch] action restart (up to date)
     (up to date)
Recipe: private-chef::bookshelf
  * component_runit_service[bookshelf] action restart
  Recipe: <Dynamically Defined Resource>
    * service[bookshelf] action nothing (skipped due to action :nothing)
    * runit_service[bookshelf] action restart (up to date)
     (up to date)
Recipe: private-chef::opscode-erchef
  * component_runit_service[opscode-erchef] action restart
  Recipe: <Dynamically Defined Resource>
    * service[opscode-erchef] action nothing (skipped due to action :nothing)
    * runit_service[opscode-erchef] action restart (up to date)
     (up to date)
Recipe: private-chef::partybus
  * execute[set initial migration level] action run
    - execute cd /opt/opscode/embedded/service/partybus && ./bin/partybus init
  * ruby_block[migration-level file check] action run (skipped due to not_if)

Running handlers:
Running handlers complete
Chef Infra Client finished, 410/885 resources updated in 01 minutes 57 seconds
Chef Server Reconfigured!

[root@rhel-chef-server ~]# sudo chef-server-ctl status
run: bookshelf: (pid 49801) 71s; run: log: (pid 49205) 110s
run: elasticsearch: (pid 49739) 71s; run: log: (pid 48975) 140s
run: nginx: (pid 49708) 71s; run: log: (pid 49482) 80s
run: oc_bifrost: (pid 49593) 72s; run: log: (pid 48821) 154s
run: oc_id: (pid 49696) 72s; run: log: (pid 48873) 146s
run: opscode-erchef: (pid 49845) 70s; run: log: (pid 49352) 107s
run: postgresql: (pid 49571) 73s; run: log: (pid 48274) 165s
run: redis_lb: (pid 49526) 74s; run: log: (pid 49524) 74s    
</pre>


#### Create an user and add it to admin group
```
sudo chef-server-ctl user-create jegan Jeganathan Swaminathan jegan@tektutor.org 'admin@123' --filename /home/jegan/jegan.pem
sudo chef-server-ctl grant-server-admin-permissions jegan
sudo chef-server-ctl org-create tektutor 'TekTutor' --association_user jegan --filename /home/jegan/org-validator.pem
```

Expected output
<pre>
[root@rhel-chef-server ~]# 
[root@rhel-chef-server ~]# sudo chef-server-ctl user-create jegan Jeganathan Swaminathan jegan@tektutor.org 'admin@123' --filename /home/jegan/jegan.pem
[root@rhel-chef-server ~]# sudo chef-server-ctl grant-server-admin-permissions jegan
User jegan was added to server-admins. This user can now list, read, create, and delete users (even for orgs they are not members of) for this Chef Server.
[root@rhel-chef-server ~]#  
[root@rhel-chef-server ~]# 
[root@rhel-chef-server ~]# sudo chef-server-ctl org-create tektutor 'TekTutor' --association_user jegan --filename /home/jegan/org-validator.pem
[root@rhel-chef-server ~]#   
</pre>

#### Info - Open Chef Server ports
```
firewall-cmd --permanent --add-service https
firewall-cmd --permanent --add-service http
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=8443/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --reload
firewall-cmd --list-all
```
Expected output
<pre>
[root@rhel-chef-server ~]# firewall-cmd --permanent --add-service https
success
[root@rhel-chef-server ~]# firewall-cmd --permanent --add-service http
success
[root@rhel-chef-server ~]# firewall-cmd --permanent --add-port=80/tcp
success
[root@rhel-chef-server ~]# firewall-cmd --permanent --add-port=8443/tcp
success
[root@rhel-chef-server ~]# firewall-cmd --permanent --add-port=443/tcp
success
[root@rhel-chef-server ~]# firewall-cmd --reload
success
[root@rhel-chef-server ~]# firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp0s3
  sources: 
  services: cockpit dhcpv6-client http https ssh
  ports: 80/tcp 8443/tcp 443/tcp
  protocols: 
  forward: no
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules:  
</pre>


## INfo - Make sure your RHEL Chef Server /etc/hosts is updated with Chef Server, Workstation and node IP addresses
<pre>
[root@rhel-chef-server ~]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

192.168.1.65 rhel-chef-server
192.168.1.66 rhel-chef-workstation
192.168.1.67 rhel-chef-node
192.168.1.151 windows-chef-node 
</pre>

## Info - Installing Chef Workstation in RHEL v8.9

#### First we need to install Ruby 3.1
```
yum module list ruby
yum install @ruby:3.1
ruby --version
```

Expected output
<pre>
[root@rhel-chef-workstation backup]# yum module list ruby
Updating Subscription Management repositories.
Last metadata expiration check: 2:57:51 ago on Sunday 25 February 2024 01:16:21 PM IST.
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)
Name         Stream         Profiles          Summary                                                    
ruby         2.5 [d]        common [d]        An interpreter of object-oriented scripting language       
ruby         2.6            common [d]        An interpreter of object-oriented scripting language       
ruby         2.7            common [d]        An interpreter of object-oriented scripting language       
ruby         3.0            common [d]        An interpreter of object-oriented scripting language       
ruby         3.1            common [d]        An interpreter of object-oriented scripting language       

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled

[root@rhel-chef-workstation backup]# yum install -y @ruby:3.1
Updating Subscription Management repositories.
Last metadata expiration check: 2:58:34 ago on Sunday 25 February 2024 01:16:21 PM IST.
Dependencies resolved.
=========================================================================================================
 Package          Arch   Version                                  Repository                        Size
=========================================================================================================
Installing group/module packages:
 ruby             x86_64 3.1.2-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms  90 k
Installing dependencies:
 ruby-default-gems
                  noarch 3.1.2-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms  79 k
 ruby-libs        x86_64 3.1.2-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms 3.3 M
 rubygem-io-console
                  x86_64 0.5.11-141.module+el8.7.0+15051+29b42f0c rhel-8-for-x86_64-appstream-rpms  73 k
 rubygem-json     x86_64 2.6.1-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms 100 k
 rubygem-psych    x86_64 4.0.3-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms  99 k
Installing weak dependencies:
 rubygem-bigdecimal
                  x86_64 3.1.1-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms 114 k
 rubygem-bundler  noarch 2.3.7-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms 449 k
 rubygem-rdoc     noarch 6.4.0-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms 518 k
 rubygems         noarch 3.3.7-141.module+el8.7.0+15051+29b42f0c  rhel-8-for-x86_64-appstream-rpms 320 k
Installing module profiles:
 ruby/common                                                                                            
Enabling module streams:
 ruby                    3.1                                                                            

Transaction Summary
=========================================================================================================
Install  10 Packages

Total download size: 5.1 M
Installed size: 16 M
Downloading Packages:
(1/10): ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch 185 kB/s |  79 kB     00:00    
(2/10): ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm          206 kB/s |  90 kB     00:00    
(3/10): ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm     5.2 MB/s | 3.3 MB     00:00    
(4/10): rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_6 398 kB/s | 114 kB     00:00    
(5/10): rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch.r 1.4 MB/s | 449 kB     00:00    
(6/10): rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm  345 kB/s | 100 kB     00:00    
(7/10): rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64.rpm 338 kB/s |  99 kB     00:00    
(8/10): rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_ 159 kB/s |  73 kB     00:00    
(9/10): rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch.rpm  582 kB/s | 518 kB     00:00    
(10/10): rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch.rpm     196 kB/s | 320 kB     00:01    
---------------------------------------------------------------------------------------------------------
Total                                                                    1.9 MB/s | 5.1 MB     00:02     
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)                 4.9 MB/s | 5.0 kB     00:00    
Importing GPG key 0xFD431D51:
 Userid     : "Red Hat, Inc. (release key 2) <security@redhat.com>"
 Fingerprint: 567E 347A D004 4ADE 55BA 8A5F 199E 2F91 FD43 1D51
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
Key imported successfully
Importing GPG key 0xD4082792:
 Userid     : "Red Hat, Inc. (auxiliary key) <security@redhat.com>"
 Fingerprint: 6A6A A7C9 7C88 90AE C6AE BFE2 F76F 66C3 D408 2792
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                 1/1 
  Installing       : ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                       1/10 
  Installing       : rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_64              2/10 
  Installing       : ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch               3/10 
  Installing       : rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                 4/10 
  Installing       : rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_64             5/10 
  Installing       : rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64                    6/10 
  Installing       : rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64                   7/10 
  Installing       : rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch                    8/10 
  Installing       : rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                        9/10 
  Installing       : ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                           10/10 
  Running scriptlet: ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                           10/10 
  Verifying        : ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                            1/10 
  Verifying        : ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch               2/10 
  Verifying        : ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                       3/10 
  Verifying        : rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_64              4/10 
  Verifying        : rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                 5/10 
  Verifying        : rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_64             6/10 
  Verifying        : rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64                    7/10 
  Verifying        : rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64                   8/10 
  Verifying        : rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch                    9/10 
  Verifying        : rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                       10/10 
Installed products updated.

Installed:
  ruby-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                                                    
  ruby-default-gems-3.1.2-141.module+el8.7.0+15051+29b42f0c.noarch                                       
  ruby-libs-3.1.2-141.module+el8.7.0+15051+29b42f0c.x86_64                                               
  rubygem-bigdecimal-3.1.1-141.module+el8.7.0+15051+29b42f0c.x86_64                                      
  rubygem-bundler-2.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                                         
  rubygem-io-console-0.5.11-141.module+el8.7.0+15051+29b42f0c.x86_64                                     
  rubygem-json-2.6.1-141.module+el8.7.0+15051+29b42f0c.x86_64                                            
  rubygem-psych-4.0.3-141.module+el8.7.0+15051+29b42f0c.x86_64                                           
  rubygem-rdoc-6.4.0-141.module+el8.7.0+15051+29b42f0c.noarch                                            
  rubygems-3.3.7-141.module+el8.7.0+15051+29b42f0c.noarch                                                

Complete!
[root@rhel-chef-workstation backup]# ruby --version
ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux] 
</pre>


Now let's proceed with Chef workstation installation. For other OS refer https://docs.chef.io/workstation/install_workstation/
```
sudo -i
wget https://packages.chef.io/files/stable/chef-workstation/21.10.640/el/8/chef-workstation-21.10.640-1.el8.x86_64.rpm
rpm -ivh ./chef-workstation-21.10.640-1.el8.x86_64.rpm
chef -v
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# wget https://packages.chef.io/files/stable/chef-workstation/21.10.640/el/8/chef-workstation-21.10.640-1.el8.x86_64.rpm
--2024-02-25 00:29:48--  https://packages.chef.io/files/stable/chef-workstation/21.10.640/el/8/chef-workstation-21.10.640-1.el8.x86_64.rpm
Resolving packages.chef.io (packages.chef.io)... 199.232.106.110
Connecting to packages.chef.io (packages.chef.io)|199.232.106.110|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 131027652 (125M) [application/x-rpm]
Saving to: ‘chef-workstation-21.10.640-1.el8.x86_64.rpm’

chef-workstation-21.10.640-1.el 100%[======================================================>] 124.96M  24.2MB/s    in 5.5s    

2024-02-25 00:29:57 (22.6 MB/s) - ‘chef-workstation-21.10.640-1.el8.x86_64.rpm’ saved [131027652/131027652]

[root@rhel-chef-workstation ~]# rpm -ivh ./chef-workstation-21.10.640-1.el8.x86_64.rpm
warning: ./chef-workstation-21.10.640-1.el8.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 83ef826a: NOKEY
Verifying...                          ################################# [100%]
Preparing...                          ################################# [100%]
Updating / installing...
   1:chef-workstation-21.10.640-1.el8 ################################# [100%]
ldd: /opt/chef-workstation/components/chef-workstation-app/chef-workstation-app: No such file or directory

The Chef Workstation App is available.

Launch the App by running 'chef-workstation-app'.
The App will then be available in the system tray.

Thank you for installing Chef Workstation!
You can find some tips on getting started at https://docs.chef.io/workstation/getting_started/

[root@rhel-chef-workstation ~]# chef -v
Chef Workstation version: 21.10.640
Test Kitchen version: 3.1.0
Cookstyle version: 7.25.6
Chef Infra Client version: 17.6.18
Chef InSpec version: 4.46.13
Chef CLI version: 5.4.2
Chef Habitat version: 1.6.351
 
</pre>

## Connecting Chef Workstation with Chef Server ( Do this in Chef Workstation Machine )

#### Make sure your Chef Workstation /etc/file has the IP addresses of your Chef Server, Chef Workstation and respective Chef nodes
<pre>
[root@rhel-chef-workstation ~]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

192.168.1.65 rhel-chef-server
192.168.1.66 rhel-chef-workstation
192.168.1.67 rhel-chef-node
192.168.1.151 windows-chef-node 
</pre>


You may now configure knife tool to connect with Chef server
```
knife --version
knife configure

cd /root/.chef
scp jegan@rhel-chef-server:/home/jegan/jegan.pem .
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife --version
Chef Infra Client: 17.6.18
[root@rhel-chef-workstation ~]# knife configure
WARNING: No knife configuration file found. See https://docs.chef.io/config_rb/ for details.
Please enter the chef server URL: [https://rhel-chef-workstation/organizations/myorg] https://rhel-chef-server:443/organizations/tektutor    
Please enter an existing username or clientname for the API: [root] jegan
*****

You must place your client key in:
  /root/.chef/jegan.pem
Before running commands with Knife

*****
Knife configuration file written to /root/.chef/credentials 

[root@rhel-chef-workstation ~]# cd /root/.chef
[root@rhel-chef-workstation .chef]# scp jegan@rhel-chef-server:/home/jegan/jegan.pem .
jegan@rhel-chef-server's password: 
jegan.pem                                                                                    100% 1678   748.2KB/s   00:00    
[root@rhel-chef-workstation .chef]# ls
credentials  jegan.pem
</pre>

#### Info - Download the self-signed certificate from Chef Server to Chef Workstation ( Do this in Chef Workstation Machine )
```
knife ssl fetch
knife ssl check
knife config list-profiles
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife ssl fetch
WARNING: Certificates from rhel-chef-server will be fetched and placed in your trusted_cert
       directory (/root/.chef/trusted_certs).
       
       Knife has no means to verify these are the correct certificates. You should
       verify the authenticity of these certificates after downloading.
Adding certificate for rhel-chef-server in /root/.chef/trusted_certs/rhel-chef-server.crt
 
[root@rhel-chef-workstation ~]# knife ssl check
Connecting to host rhel-chef-server:443
Successfully verified certificates from `rhel-chef-server' 

[root@rhel-chef-workstation ~]# knife config list-profiles
 Profile  Client  Key                Server                                              
--------------------------------------------------------------------------------------
*default  jegan   ~/.chef/jegan.pem  https://rhel-chef-server:443/organizations/tektutor 
 
</pre>

At this point, no Chef nodes are connected with Chef server
```
knife node list
```
You will see an empty list.

#### Info - Troubleshooting ssl fetch errors
```
knife ssl fetch
```

If you get this output, make sure you opened 443 port in rhel-chef-server
<pre>
root@rhel-chef-workstation ~]# knife ssl fetch
WARNING: Certificates from rhel-chef-server will be fetched and placed in your trusted_cert
       directory (/root/.chef/trusted_certs).
       
       Knife has no means to verify these are the correct certificates. You should
       verify the authenticity of these certificates after downloading.
ERROR: Errno::EHOSTUNREACH: No route to host - connect(2) for "rhel-chef-server" port 443 
</pre>


## Configuring chef server ip in windows node
```
C:\Windows\system32\drivers\etc\host file
```

## Info - Need to enable winrm in windows machine in Powershell
```
winrm quickconfig
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
```

## Info - Bootstrapping RHEL Chef Nodes ( Do this from Chef Workstation Machine )
```
knife bootstrap rhel-chef-node --ssh-user root --ssh-password admin@123 --node-name rhel-chef-node
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife bootstrap rhel-chef-node --ssh-user root --ssh-password root --node-name rhel-chef-node
--ssh-user: This flag is deprecated. Use -U/--connection-user instead.
--ssh-password: This flag is deprecated. Use -P/--connection-password instead.
+---------------------------------------------+
            Chef License Acceptance

Before you can continue, 2 product licenses
must be accepted. View the license at
https://www.chef.io/end-user-license-agreement/

Licenses that need accepting:
  * Chef Infra Client
  * Chef InSpec

Do you accept the 2 product licenses (yes/no)?

> yes

Persisting 2 product licenses...
✔ 2 product licenses persisted.

+---------------------------------------------+
Connecting to rhel-chef-node using ssh
The authenticity of host 'rhel-chef-node (192.168.1.67)' can't be established.
fingerprint is SHA256:0f05sz2b6js2LveFNwlWr0duVEKL+4oiDHAC0nRdfMU.

Are you sure you want to continue connecting
? (Y/N) Y
Connecting to rhel-chef-node using ssh
Creating new client for rhel-chef-node
Creating new node for rhel-chef-node
Bootstrapping rhel-chef-node
 [rhel-chef-node] -----> Installing Chef Omnibus (stable/17)
downloading https://omnitruck.chef.io/chef/install.sh
  to file /tmp/install.sh.5606/install.sh

     [2024-02-25T01:06:57+05:30] WARN: Error connecting to https://rhel-chef-server/organizations/tektutor/data-collector, retry 2/5
     [2024-02-25T01:07:02+05:30] WARN: Error connecting to https://rhel-chef-server/organizations/tektutor/data-collector, retry 3/5
     [2024-02-25T01:07:07+05:30] WARN: Error connecting to https://rhel-chef-server/organizations/tektutor/data-collector, retry 4/5
     [2024-02-25T01:07:13+05:30] WARN: Error connecting to https://rhel-chef-server/organizations/tektutor/data-collector, retry 5/5
     [2024-02-25T01:07:18+05:30] WARN: Error while reporting run start to Data Collector. URL: https://rhel-chef-server:443/organizations/tektutor/data-collector Exception: No HTTP Code -- Error connecting to https://rhel-chef-server/organizations/tektutor/data-collector - Failed to open TCP connection to rhel-chef-server:443 (getaddrinfo: Name or service not known) 
     [2024-02-25T01:07:18+05:30] FATAL: Stacktrace dumped to /var/chef/cache/chef-stacktrace.out
     [2024-02-25T01:07:18+05:30] FATAL: ---------------------------------------------------------------------------------------
     [2024-02-25T01:07:18+05:30] FATAL: PLEASE PROVIDE THE CONTENTS OF THE stacktrace.out FILE (above) IF YOU FILE A BUG REPORT
     [2024-02-25T01:07:18+05:30] FATAL: ---------------------------------------------------------------------------------------
     [2024-02-25T01:07:18+05:30] FATAL: SocketError: Error connecting to https://rhel-chef-server/organizations/tektutor/nodes/rhel-chef-node - Failed to open TCP connection to rhel-chef-server:443 (getaddrinfo: Name or service not known)
      warning: /tmp/install.sh.5629/chef-17.10.114-1.el8.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 83ef826a: NOKEY 
</pre>

Troubleshooting above error, we need to add the Server IP address in the /etc/hosts file as shown below on the rhel-chef-node
<pre>
[root@rhel-chef-node ~]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

192.168.1.65 rhel-chef-server
192.168.1.66 rhel-chef-workstation
192.168.1.67 rhel-chef-node 
</pre>

Now, let's retry the boostrapping

```
knife bootstrap rhel-chef-node --ssh-user root --ssh-password root --node-name rhel-chef-node
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife bootstrap rhel-chef-node --ssh-user root --ssh-password root --node-name rhel-chef-node
--ssh-user: This flag is deprecated. Use -U/--connection-user instead.
--ssh-password: This flag is deprecated. Use -P/--connection-password instead.
Connecting to rhel-chef-node using ssh
The authenticity of host 'rhel-chef-node (192.168.1.67)' can't be established.
fingerprint is SHA256:0f05sz2b6js2LveFNwlWr0duVEKL+4oiDHAC0nRdfMU.

Are you sure you want to continue connecting
? (Y/N) Y
Connecting to rhel-chef-node using ssh
Node rhel-chef-node exists, overwrite it? (Y/N) Y
Client rhel-chef-node exists, overwrite it? (Y/N) Y
Creating new client for rhel-chef-node
Creating new node for rhel-chef-node
Bootstrapping rhel-chef-node
 [rhel-chef-node] -----> Existing Chef Infra Client installation detected
 [rhel-chef-node] Starting the first Chef Infra Client Client run...
 [rhel-chef-node] Chef Infra Client, version 17.10.114
Patents: https://www.chef.io/patents
Infra Phase starting
 [rhel-chef-node] Resolving cookbooks for run list: []
 [rhel-chef-node] Synchronizing cookbooks:
 [rhel-chef-node] Installing cookbook gem dependencies:
 [rhel-chef-node] Compiling cookbooks...
 [rhel-chef-node] Loading Chef InSpec profile files:
 [rhel-chef-node] Loading Chef InSpec input files:
Loading Chef InSpec waiver files:
 [rhel-chef-node] [2024-02-25T01:10:08+05:30] WARN: Node rhel-chef-node has an empty run list.
 [rhel-chef-node] Converging 0 resources
 [rhel-chef-node] 
Running handlers:
Running handlers complete
 [rhel-chef-node] Infra Phase complete, 0/0 resources updated in 04 seconds 
</pre>


## Info - Bootstrapping Windows Chef Nodes ( Do this from Chef Workstation Machine )
```
knife bootstrap windows-chef-node -o winrm -U Administrator -P admin@123 --node-name windows-chef-node -p 5985`
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife bootstrap windows-chef-node -o winrm -U Administrator -P admin@123 -N windows-chef-node -p 5985
Connecting to windows-chef-node using winrm
Creating new client for windows-chef-node
Creating new node for windows-chef-node
Bootstrapping windows-chef-node
 [windows-chef-node] Checking for existing directory "C:\chef"...
 [windows-chef-node] Existing directory not found, creating.
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>(
 [windows-chef-node] echo.url = WScript.Arguments.Named("url")  
 [windows-chef-node]  echo.path = WScript.Arguments.Named("path")  
 [windows-chef-node]  echo.proxy = null  
 [windows-chef-node]  echo.'* Vaguely attempt to handle file:// scheme urls by url unescaping and switching all  
 [windows-chef-node]  echo.'* / into .  Also assume that file:/// is a local absolute path and that file://<foo>  
 [windows-chef-node]  echo.'* is possibly a network file path.  
 [windows-chef-node]  echo.If InStr(url, "file://") = 1 Then  
 [windows-chef-node]  echo.url = Unescape(url)  
 [windows-chef-node]  echo.If InStr(url, "file:///") = 1 Then  
 [windows-chef-node]  echo.sourcePath = Mid(url, Len("file:///") + 1)  
 [windows-chef-node]  echo.Else 
 [windows-chef-node]  echo.sourcePath = Mid(url, Len("file:") + 1)  
 [windows-chef-node]  echo.End If  
 [windows-chef-node]  echo.sourcePath = Replace(sourcePath, "/", "\")  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.Set objFSO = CreateObject("Scripting.FileSystemObject")  
 [windows-chef-node]  echo.If objFSO.Fileexists(path) Then objFSO.DeleteFile path  
 [windows-chef-node]  echo.objFSO.CopyFile sourcePath, path, true  
 [windows-chef-node]  echo.Set objFSO = Nothing  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.Else 
 [windows-chef-node]  echo.Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP")  
 [windows-chef-node]  echo.Set wshShell = CreateObject( "WScript.Shell" )  
 [windows-chef-node]  echo.Set objUserVariables = wshShell.Environment("USER")  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.rem http proxy is optional  
 [windows-chef-node]  echo.rem attempt to read from HTTP_PROXY env var first  
 [windows-chef-node]  echo.On Error Resume Next  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.If NOT (objUserVariables("HTTP_PROXY") = "") Then  
 [windows-chef-node]  echo.proxy = objUserVariables("HTTP_PROXY")  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.rem fall back to named arg  
 [windows-chef-node]  echo.ElseIf NOT (WScript.Arguments.Named("proxy") = "") Then  
 [windows-chef-node]  echo.proxy = WScript.Arguments.Named("proxy")  
 [windows-chef-node]  echo.End If  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.If NOT isNull(proxy) Then  
 [windows-chef-node]  echo.rem setProxy method is only available on ServerXMLHTTP 6.0+  
 [windows-chef-node]  echo.Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0")  
 [windows-chef-node]  echo.objXMLHTTP.setProxy 2, proxy  
 [windows-chef-node]  echo.End If  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.On Error Goto 0  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.objXMLHTTP.open "GET", url, false  
 [windows-chef-node]  echo.objXMLHTTP.send() 
 [windows-chef-node]  echo.If objXMLHTTP.Status = 200 Then  
 [windows-chef-node]  echo.Set objADOStream = CreateObject("ADODB.Stream")  
 [windows-chef-node]  echo.objADOStream.Open 
 [windows-chef-node]  echo.objADOStream.Type = 1  
 [windows-chef-node]  echo.objADOStream.Write objXMLHTTP.ResponseBody  
 [windows-chef-node]  echo.objADOStream.Position = 0  
 [windows-chef-node]  echo.Set objFSO = Createobject("Scripting.FileSystemObject")  
 [windows-chef-node]  echo.If objFSO.Fileexists(path) Then objFSO.DeleteFile path  
 [windows-chef-node]  echo.Set objFSO = Nothing  
 [windows-chef-node]  echo.objADOStream.SaveToFile path  
 [windows-chef-node]  echo.objADOStream.Close 
 [windows-chef-node]  echo.Set objADOStream = Nothing  
 [windows-chef-node]  echo.End If  
 [windows-chef-node]  echo.Set objXMLHTTP = Nothing  
 [windows-chef-node]  echo.End If 
 [windows-chef-node] ) 1>C:\chef\wget.vbs 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>(
 [windows-chef-node] echo.param( 
 [windows-chef-node]  echo.   [String] $remoteUrl,  
 [windows-chef-node]  echo.   [String] $localPath  
 [windows-chef-node]  echo.) 
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.$ProxyUrl = $env:http_proxy;  
 [windows-chef-node]  echo.$webClient = new-object System.Net.WebClient;  
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.if ($ProxyUrl -ne '') {  
 [windows-chef-node]  echo.  $WebProxy = New-Object System.Net.WebProxy($ProxyUrl,$true)  
 [windows-chef-node]  echo.  $WebClient.Proxy = $WebProxy  
 [windows-chef-node]  echo.} 
 [windows-chef-node]  echo. 
 [windows-chef-node]  echo.$webClient.DownloadFile($remoteUrl, $localPath); 
 [windows-chef-node] ) 1>C:\chef\wget.ps1 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>(
 [windows-chef-node]  
 [windows-chef-node]   
 [windows-chef-node]  
 [windows-chef-node] ) 
 [windows-chef-node] Detected Windows Version 10.0 Build 20348
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>goto Version10.0 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>goto architecture_select 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>IF "AMD64" == "x86" IF not defined PROCESSOR_ARCHITEW6432 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>goto chef_installed 
 [windows-chef-node] Checking for existing Chef Infra Client installation
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>WHERE chef-client  1>nul 2>nul 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>If !ERRORLEVEL! == 0 (
 [windows-chef-node]  
 [windows-chef-node]  goto key_create 
 [windows-chef-node] )  else (
 [windows-chef-node]  
 [windows-chef-node]  goto install 
 [windows-chef-node] ) 
 [windows-chef-node] No existing installation of Chef Infra Client detected
 [windows-chef-node] Checking for existing downloaded package at "C:\Users\ADMINI~1\AppData\Local\Temp\chef-client-latest.msi"
 [windows-chef-node] No existing downloaded packages to delete.
 [windows-chef-node] Attempting to download client package using PowerShell if available...
 [windows-chef-node] powershell.exe -ExecutionPolicy Unrestricted -InputFormat None -NoProfile -NonInteractive -File  C:\chef\wget.ps1 "https://omnitruck.chef.io/chef/download?p=windows&pv=2016&m=x86_64&DownloadContext=PowerShell&channel=stable&v=17" "C:\Users\ADMINI~1\AppData\Local\Temp\chef-client-latest.msi"
 [windows-chef-node] Download via PowerShell succeeded.
 [windows-chef-node] Installing downloaded client package...
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>msiexec /qn /log "C:\Users\ADMINI~1\AppData\Local\Temp\chef-client-msi6327.log" /i "C:\Users\ADMINI~1\AppData\Local\Temp\chef-client-latest.msi" 
 [windows-chef-node] Successfully installed Chef Infra Client package.
 [windows-chef-node] Installation completed successfully
 [windows-chef-node] Writing validation key...
 [windows-chef-node] Validation key written.
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>(
 [windows-chef-node] echo.-----BEGIN CERTIFICATE-----  
 [windows-chef-node]  echo.MIIEDjCCAvagAwIBAgIVAMENppZ34J6NMoZC6L6nlKRQOvZjMA0GCSqGSIb3DQEB 
 [windows-chef-node]  echo.CwUAME8xCzAJBgNVBAYTAlVTMRAwDgYDVQQKDAdZb3VDb3JwMRMwEQYDVQQLDApP 
 [windows-chef-node]  echo.cGVyYXRpb25zMRkwFwYDVQQDDBByaGVsLWNoZWYtc2VydmVyMB4XDTI0MDIyNDE4 
 [windows-chef-node]  echo.NDE0MFoXDTM0MDIyMTE4NDE0MFowTzELMAkGA1UEBhMCVVMxEDAOBgNVBAoMB1lv 
 [windows-chef-node]  echo.dUNvcnAxEzARBgNVBAsMCk9wZXJhdGlvbnMxGTAXBgNVBAMMEHJoZWwtY2hlZi1z 
 [windows-chef-node]  echo.ZXJ2ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDWpM/2tJVnjJhn 
 [windows-chef-node]  echo.Dphf047HSqEreCYCU/dGjbemjTbscFxw4w+TUo7HIKGGFrbwoev3yM3Msi+R+BAz 
 [windows-chef-node]  echo.tV6gZIb0wwLQI63JBu9OBlBC+6fwVNJwPkYYFe+ngWD62iI2FPy155vXUQDYVq4D 
 [windows-chef-node]  echo.IG+q5Z4y9U1MUnTmW8MrKkFrlHHMghwM1hlk5k4qc4QTbZR/HmgRtoOlwCatwbLT 
 [windows-chef-node]  echo.9Pv/UAvrDNF7LhGOouzaaxnQze5/ZKuyPBTBy6Qhz0aQpQf0p4MYXoRqDye4wM3S 
 [windows-chef-node]  echo.EWzNmMUw8fkk+b9C50W27+64fOfIxHSt0QZpXBIWK3nxRhNO4ffClLvJGonQ4Cxc 
 [windows-chef-node]  echo.NH/hqmdfAgMBAAGjgeAwgd0wGwYDVR0RBBQwEoIQcmhlbC1jaGVmLXNlcnZlcjAP 
 [windows-chef-node]  echo.BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRWU0aD+y6TBG9dM2ajZWb2nenk1jCB 
 [windows-chef-node]  echo.jQYDVR0jBIGFMIGCgBRWU0aD+y6TBG9dM2ajZWb2nenk1qFTpFEwTzELMAkGA1UE 
 [windows-chef-node]  echo.BhMCVVMxEDAOBgNVBAoMB1lvdUNvcnAxEzARBgNVBAsMCk9wZXJhdGlvbnMxGTAX 
 [windows-chef-node]  echo.BgNVBAMMEHJoZWwtY2hlZi1zZXJ2ZXKCFQDBDaaWd+CejTKGQui+p5SkUDr2YzAN 
 [windows-chef-node]  echo.BgkqhkiG9w0BAQsFAAOCAQEAu8htuXMjsPjuQjIwHBRGMH2je1c9J8s0/0MAxJwH 
 [windows-chef-node]  echo.uY0/AtI7TSg+Ne/o0h4nNSMT91Gzk0GIq2Hddhc64V4PP+pZvvWVAAOENm+k/QXz 
 [windows-chef-node]  echo.2m/9C46/ExwHnw8RzPCwDVfh3f2r7Dd5PwhP5AU/ZGf4MfeFIIwnn5Gw2pXSXvBO 
 [windows-chef-node]  echo.fARDAp95sEXQf7hLfXef/6y8PuliecKu4rHgcPHoR6UrdyW8b/K9DkwrDnK4J83t 
 [windows-chef-node]  echo.fZ3/7TFVQ1CmFwkzddlfPn6Hp2PGkfsWhmMF5y9qJM5fXpVOGRawRNaMMphBDWD3 
 [windows-chef-node]  echo.Amr8r4R8MmBEx8eKcM4GhyQXj+jmjJJO4URlQd87vMAfLw==  
 [windows-chef-node]  echo.-----END CERTIFICATE----- 
 [windows-chef-node] ) 1>C:\chef/trusted_certs/rhel-chef-server.crt 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>(
 [windows-chef-node] echo.chef_server_url  "https://rhel-chef-server:443/organizations/tektutor"  
 [windows-chef-node]  echo.validation_client_name "tektutor-validator"  
 [windows-chef-node]  echo.file_cache_path   "C:\\chef\\cache"  
 [windows-chef-node]  echo.file_backup_path  "C:\\chef\\backup"  
 [windows-chef-node]  echo.cache_options     ({:path => "C:\\chef\\cache\\checksums", :skip_expires => true})  
 [windows-chef-node]  echo.chef_license "accept"  
 [windows-chef-node]  echo.node_name "windows-chef-node"  
 [windows-chef-node]  echo.log_level        :auto  
 [windows-chef-node]  echo.log_location       STDOUT  
 [windows-chef-node]  echo.trusted_certs_dir "C:\\chef\\trusted_certs" 
 [windows-chef-node] ) 1>C:\chef\client.rb 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>(echo.{"run_list":[]}) 1>C:\chef\first-boot.json 
 [windows-chef-node] Starting chef-client to bootstrap the node...
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>SET "PATH=;C:\Windows;\Wbem;\WindowsPowerShell\v1.0\;C:\ruby\bin;C:\opscode\chef\bin;C:\opscode\chef\embedded\bin;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps" 
 [windows-chef-node] 
 [windows-chef-node] C:\Users\Administrator\Documents>chef-client -c C:\chef\client.rb -j C:\chef\first-boot.json 
 [windows-chef-node] +---------------------------------------------+
 [windows-chef-node] âœ” 2 product licenses accepted.
 [windows-chef-node] +---------------------------------------------+
 [windows-chef-node] Chef Infra Client, version 17.10.114
 [windows-chef-node] Patents: https://www.chef.io/patents
 [windows-chef-node] Infra Phase starting
 [windows-chef-node] Resolving cookbooks for run list: []
 [windows-chef-node] Synchronizing cookbooks:
 [windows-chef-node] Installing cookbook gem dependencies:
 [windows-chef-node] Compiling cookbooks...
 [windows-chef-node] Loading Chef InSpec profile files:
 [windows-chef-node] Loading Chef InSpec input files:
 [windows-chef-node] Loading Chef InSpec waiver files:
 [windows-chef-node] [2024-02-24T17:12:25-08:00] WARN: Node windows-chef-node has an empty run list.
 [windows-chef-node] Converging 0 resources
 [windows-chef-node] 
 [windows-chef-node] Running handlers:
 [windows-chef-node] Running handlers complete
 [windows-chef-node] Infra Phase complete, 0/0 resources updated in 32 seconds
</pre>

## Testing Chef installation ( RHEL v8.9 - Chef Workstation )
```
knife node list
chef -v
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife node list
rhel-chef-node
windows-chef-node

[root@rhel-chef-workstation ~]# chef -v
Chef Workstation version: 21.10.640
Chef Habitat version: 1.6.351
Test Kitchen version: 3.1.0
Cookstyle version: 7.25.6
Chef Infra Client version: 17.6.18
Chef InSpec version: 4.46.13
Chef CLI version: 5.4.2 
</pre>


## Testing RHEL Chef Node ( As root user )
```
chef-client --version

chef-client
```

Expected output
<pre>
[root@rhel-chef-node ~]# chef-client --version
Chef Infra Client: 17.10.114
 
[root@rhel-chef-node ~]# chef-client
Chef Infra Client, version 17.10.114
Patents: https://www.chef.io/patents
Infra Phase starting
Resolving cookbooks for run list: []
Synchronizing cookbooks:
Installing cookbook gem dependencies:
Compiling cookbooks...
Loading Chef InSpec profile files:
Loading Chef InSpec input files:
Loading Chef InSpec waiver files:
[2024-02-25T07:18:03+05:30] WARN: Node rhel-chef-node has an empty run list.
Converging 0 resources

Running handlers:
Running handlers complete
Infra Phase complete, 0/0 resources updated in 03 seconds 
</pre>

## Enabling Chef Server Management Console
```
chef-server-ctl install chef-manage

chef-server-ctl reconfigure

chef-manage-ctl reconfigure
```

Expected output
<pre>
[root@rhel-chef-server ~]# chef-server-ctl install chef-manage
Starting Chef Infra Client, version 16.13.16
Patents: https://www.chef.io/patents
resolving cookbooks for run list: ["private-chef::add_ons_wrapper"]
Synchronizing Cookbooks:
  - private-chef (0.1.2)
  - runit (5.1.6)
  - packagecloud (1.0.1)
  - enterprise (1.1.0)
  - yum-epel (4.1.4)
Installing Cookbook Gems:
Compiling Cookbooks...
Converging 4 resources
Recipe: private-chef::add_ons_wrapper
  * ruby_block[addon_install_notification_chef-manage] action nothing (skipped due to action :nothing)
  * remote_file[/var/opt/opscode/local-mode-cache/chef-manage-3.3.96-1.el7.x86_64.rpm] action create
    - create new file /var/opt/opscode/local-mode-cache/chef-manage-3.3.96-1.el7.x86_64.rpm
    - update content in file /var/opt/opscode/local-mode-cache/chef-manage-3.3.96-1.el7.x86_64.rpm from none to 889f4e
    (file sizes exceed 10000000 bytes, diff output suppressed)
    - restore selinux security context
  * ruby_block[locate_addon_package_chef-manage] action run
    - execute the ruby block locate_addon_package_chef-manage
  * dnf_package[chef-manage] action install
    - install version 3.3.96-1.el7 of package chef-manage
  * ruby_block[addon_install_notification_chef-manage] action run
    - execute the ruby block addon_install_notification_chef-manage

Running handlers:
-- Installed Add-On Package: chef-manage
  - #<Class:0x0000000004a94a08>::AddonInstallHandler
Running handlers complete
Chef Infra Client finished, 4/5 resources updated in 27 seconds
[root@rhel-chef-server ~]# 

[root@rhel-chef-server ~]# chef-server-ctl reconfigure

Documentation: https://docs.chef.io/server/
Patents:       https://www.chef.io/patents

Starting Chef Infra Client, version 16.13.16
Patents: https://www.chef.io/patents
resolving cookbooks for run list: ["private-chef::default"]
Synchronizing Cookbooks:
  - enterprise (1.1.0)
  - packagecloud (1.0.1)
  - runit (5.1.6)
  - private-chef (0.1.2)
  - yum-epel (4.1.4)
Installing Cookbook Gems:
Compiling Cookbooks...
Recipe: private-chef::default
  * directory[/etc/opscode] action create (up to date)
  * directory[/etc/opscode/logrotate.d] action create (up to date)
  Converging 218 resources
  * link[/usr/bin/private-chef-ctl] action create (up to date)
  * link[/usr/bin/chef-server-ctl] action create (up to date)
  * directory[/etc/opscode] action nothing (skipped due to action :nothing)
  * directory[/etc/opscode/logrotate.d] action nothing (skipped due to action :nothing)
  * log[opscode_webui deprecation notice] action write (skipped due to only_if)
Recipe: private-chef::users
  * linux_user[opscode] action create (up to date)
  * group[opscode] action create (up to date)
Recipe: private-chef::private_keys
  * file[/etc/opscode/pivotal.pem] action create (up to date)
  * file[/etc/opscode/webui_priv.pem] action create (up to date)
  * file[/etc/opscode/webui_pub.pem] action create (up to date)
Recipe: private-chef::default
  * file[/etc/opscode/dark_launch_features.json] action create (up to date)
  * directory[/etc/chef] action create (up to date)
  * directory[/var/opt/opscode] action create (up to date)
  * directory[/var/log/opscode] action create (up to date)
Recipe: enterprise::runit
  * component_runit_supervisor[private_chef] action create
    * template[/etc/systemd/system/private_chef-runsvdir-start.service] action create (up to date)
    * execute[systemctl daemon-reload] action nothing (skipped due to action :nothing)
    * file[/usr/lib/systemd/system/private_chef-runsvdir-start.service] action delete (up to date)
    * service[private_chef-runsvdir-start.service] action enable (up to date)
    * service[private_chef-runsvdir-start.service] action start (up to date)
     (up to date)
Recipe: private-chef::sysctl-updates
  * execute[sysctl-reload] action nothing (skipped due to action :nothing)
  * bash[dual ip4/ip6 portbind] action run (skipped due to only_if)
Recipe: private-chef::fix_permissions
  * execute[find /opt/opscode/embedded/lib/ruby/gems/*/gems -perm /u=x,g=x,o=x -exec chmod 755 {} \;] action run
    - execute find /opt/opscode/embedded/lib/ruby/gems/*/gems -perm /u=x,g=x,o=x -exec chmod 755 {} \;
  * execute[find /opt/opscode/embedded/lib/ruby/gems/*/gems -perm /u=r,g=r,o=r ! -perm /u=x -exec chmod 644 {} \;] action run
    - execute find /opt/opscode/embedded/lib/ruby/gems/*/gems -perm /u=r,g=r,o=r ! -perm /u=x -exec chmod 644 {} \;
Recipe: private-chef::postgresql
  * linux_user[opscode-pgsql] action create (up to date)
  * directory[/var/opt/opscode/postgresql] action create (up to date)
  * file[/var/opt/opscode/postgresql/.profile] action create (up to date)
  * directory[/var/log/opscode/postgresql/13.3] action create (up to date)
  * directory[/var/opt/opscode/postgresql/13.3] action create (up to date)
  * pg_upgrade[upgrade_if_necessary] action upgrade (up to date)
  * component_runit_service[postgresql] action enable
    * template[/var/log/opscode/postgresql/13.3/config] action create (up to date)
  Recipe: <Dynamically Defined Resource>
    * service[postgresql] action nothing (skipped due to action :nothing)
    * runit_service[postgresql] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/postgresql] action create (up to date)
      * template[/opt/opscode/sv/postgresql/run] action create (up to date)
      * directory[/opt/opscode/sv/postgresql/log] action create (up to date)
      * directory[/opt/opscode/sv/postgresql/log/main] action create (up to date)
      * directory[/var/log/postgresql] action create (up to date)
      * template[/opt/opscode/sv/postgresql/log/config] action create (up to date)
      * link[/var/log/postgresql/config] action create (up to date)
      * template[/opt/opscode/sv/postgresql/log/run] action create (up to date)
      * directory[/opt/opscode/sv/postgresql/env] action create (up to date)
      * ruby_block[Delete unmanaged env files for postgresql service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/postgresql/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/postgresql/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/postgresql/control] action create (up to date)
      * template[/opt/opscode/sv/postgresql/control/t] action create (up to date)
      * link[/opt/opscode/init/postgresql] action create (up to date)
      * file[/opt/opscode/sv/postgresql/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/postgresql] action create (up to date)
      * ruby_block[wait for postgresql service socket] action run
        - execute the ruby block wait for postgresql service socket
    
  
Recipe: private-chef::postgresql
  * private_chef_pg_cluster[/var/opt/opscode/postgresql/13.3/data] action init
    * directory[/var/opt/opscode/postgresql/13.3/data] action create (up to date)
    * execute[initialize_cluster_/var/opt/opscode/postgresql/13.3/data] action run (skipped due to not_if)
    * template[/var/opt/opscode/postgresql/13.3/data/postgresql.conf] action create (up to date)
    * template[/var/opt/opscode/postgresql/13.3/data/pg_hba.conf] action create (up to date)
     (up to date)
  * link[/var/opt/opscode/postgresql/13.3/data] action create (skipped due to not_if)
  * execute[/opt/opscode/bin/private-chef-ctl start postgresql] action run
    - execute /opt/opscode/bin/private-chef-ctl start postgresql
  * ruby_block[wait for postgresql to start] action run
    - execute the ruby block wait for postgresql to start
  * pg_user[opscode-pgsql] action create (up to date)
  * private_chef_pg_database[opscode-pgsql] action create (up to date)
Recipe: private-chef::erchef_database
  * pg_user[opscode_chef] action create (up to date)
  * pg_user[opscode_chef_ro] action create (up to date)
  * private_chef_pg_database[opscode_chef] action create (up to date)
  * ruby_block[set opscode_chef ownership] action run
    - execute the ruby block set opscode_chef ownership
  * private_chef_pg_sqitch[/opt/opscode/embedded/service/opscode-erchef/schema/baseline] action nothing (skipped due to action :nothing)
  * private_chef_pg_sqitch[/opt/opscode/embedded/service/opscode-erchef/schema] action nothing (skipped due to action :nothing)
  * pg_user_table_access[opscode_chef] action create
    - GRANT CONNECT, TEMPORARY ON DATABASE opscode_chef TO opscode_chef
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO opscode_chef;
    - GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO opscode_chef
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, UPDATE ON SEQUENCES TO opscode_chef;
    - GRANT SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO opscode_chef
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO opscode_chef;
    - GRANT INSERT, SELECT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO opscode_chef
  * pg_user_table_access[opscode_chef_ro] action create
    - GRANT CONNECT ON DATABASE opscode_chef TO opscode_chef_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO opscode_chef_ro;
    - GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO opscode_chef_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON SEQUENCES TO opscode_chef_ro;
    - GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO opscode_chef_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO opscode_chef_ro;
    - GRANT SELECT ON ALL TABLES IN SCHEMA public TO opscode_chef_ro
  * directory[/opt/opscode/embedded/service/enterprise-chef-server-schema] action delete (up to date)
Recipe: private-chef::bifrost_database
  * pg_user[bifrost] action create (up to date)
  * pg_user[bifrost_ro] action create (up to date)
  * private_chef_pg_database[bifrost] action create (up to date)
  * pg_user_table_access[bifrost] action create
    - GRANT CONNECT, TEMPORARY ON DATABASE bifrost TO bifrost
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO bifrost;
    - GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO bifrost
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, UPDATE ON SEQUENCES TO bifrost;
    - GRANT SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO bifrost
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES TO bifrost;
    - GRANT INSERT, SELECT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO bifrost
  * pg_user_table_access[bifrost_ro] action create
    - GRANT CONNECT ON DATABASE bifrost TO bifrost_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO bifrost_ro;
    - GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO bifrost_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON SEQUENCES TO bifrost_ro;
    - GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO bifrost_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO bifrost_ro;
    - GRANT SELECT ON ALL TABLES IN SCHEMA public TO bifrost_ro
  * private_chef_pg_sqitch[/opt/opscode/embedded/service/oc_bifrost/db] action nothing (skipped due to action :nothing)
Recipe: private-chef::oc_id_database
  * pg_user[oc_id] action create (up to date)
  * pg_user[oc_id_ro] action create (up to date)
  * private_chef_pg_database[oc_id] action create (up to date)
  * pg_user_table_access[oc_id_ro] action create
    - GRANT CONNECT ON DATABASE oc_id TO oc_id_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO oc_id_ro;
    - GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO oc_id_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON SEQUENCES TO oc_id_ro;
    - GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO oc_id_ro
    - ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO oc_id_ro;
    - GRANT SELECT ON ALL TABLES IN SCHEMA public TO oc_id_ro
Recipe: private-chef::oc_bifrost
  * execute[/opt/opscode/bin/private-chef-ctl stop opscode-authz] action run
    - execute /opt/opscode/bin/private-chef-ctl stop opscode-authz
  * service[opscode-authz] action nothing (skipped due to action :nothing)
  * runit_service[opscode-authz] action disable
    * ruby_block[disable opscode-authz] action run (skipped due to only_if)
     (up to date)
  * directory[/opt/opscode/sv/opscode-authz] action delete (up to date)
  * directory[/var/opt/opscode/oc_bifrost] action create (up to date)
  * directory[/var/opt/opscode/oc_bifrost/bin] action create (up to date)
  * directory[/var/log/opscode/oc_bifrost] action create (up to date)
  * directory[/var/log/opscode/oc_bifrost/sasl] action create (up to date)
  * link[/opt/opscode/embedded/service/oc_bifrost/log] action create (up to date)
  * template[/var/opt/opscode/oc_bifrost/sys.config] action create (up to date)
  * link[/opt/opscode/embedded/service/oc_bifrost/sys.config] action create (up to date)
  * template[/var/opt/opscode/oc_bifrost/vm.args] action create (up to date)
  * link[/opt/opscode/embedded/service/oc_bifrost/vm.args] action create (up to date)
  * component_runit_service[oc_bifrost] action enable
    * template[/var/log/opscode/oc_bifrost/config] action create (up to date)
  Recipe: <Dynamically Defined Resource>
    * service[oc_bifrost] action nothing (skipped due to action :nothing)
    * runit_service[oc_bifrost] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/oc_bifrost] action create (up to date)
      * template[/opt/opscode/sv/oc_bifrost/run] action create (up to date)
      * directory[/opt/opscode/sv/oc_bifrost/log] action create (up to date)
      * directory[/opt/opscode/sv/oc_bifrost/log/main] action create (up to date)
      * directory[/var/log/oc_bifrost] action create (up to date)
      * template[/opt/opscode/sv/oc_bifrost/log/config] action create (up to date)
      * link[/var/log/oc_bifrost/config] action create (up to date)
      * template[/opt/opscode/sv/oc_bifrost/log/run] action create (up to date)
      * directory[/opt/opscode/sv/oc_bifrost/env] action create (up to date)
      * ruby_block[Delete unmanaged env files for oc_bifrost service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/oc_bifrost/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/oc_bifrost/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/oc_bifrost/control] action create (up to date)
      * template[/opt/opscode/sv/oc_bifrost/control/t] action create (up to date)
      * link[/opt/opscode/init/oc_bifrost] action create (up to date)
      * file[/opt/opscode/sv/oc_bifrost/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/oc_bifrost] action create (up to date)
      * ruby_block[wait for oc_bifrost service socket] action run
        - execute the ruby block wait for oc_bifrost service socket
    
  
Recipe: private-chef::oc_id
  * directory[/var/opt/opscode/oc_id] action create (up to date)
  * directory[/var/opt/opscode/oc_id/config] action create (up to date)
  * directory[/var/opt/opscode/oc_id/tmp] action create (up to date)
  * directory[/var/log/opscode/oc_id] action create (up to date)
  * directory[/opt/opscode/embedded/service/oc_id/log] action delete (skipped due to not_if)
  * directory[/opt/opscode/embedded/service/oc_id/tmp] action delete (skipped due to not_if)
  * link[/opt/opscode/embedded/service/oc_id/log] action create (up to date)
  * link[/opt/opscode/embedded/service/oc_id/tmp] action create (up to date)
  * file[/var/opt/opscode/oc_id/config/production.yml] action create (up to date)
  * file[/opt/opscode/embedded/service/oc_id/config/settings/production.yml] action delete (skipped due to not_if)
  * link[/opt/opscode/embedded/service/oc_id/config/settings/production.yml] action create (up to date)
  * template[/var/opt/opscode/oc_id/config/secret_token.rb] action create (up to date)
  * file[/opt/opscode/embedded/service/oc_id/config/initializers/secret_token.rb] action delete (skipped due to not_if)
  * link[/opt/opscode/embedded/service/oc_id/config/initializers/secret_token.rb] action create (up to date)
  * template[/var/opt/opscode/oc_id/config/database.yml] action create (up to date)
  * file[/opt/opscode/embedded/service/oc_id/config/database.yml] action delete (skipped due to not_if)
  * link[/opt/opscode/embedded/service/oc_id/config/database.yml] action create (up to date)
  * execute[chown -R opscode:opscode /var/log/opscode/oc_id] action run (skipped due to only_if)
  * execute[oc_id_schema] action run
    - execute sensitive resource
  * component_runit_service[oc_id] action enable
    * template[/var/log/opscode/oc_id/config] action create (up to date)
  Recipe: <Dynamically Defined Resource>
    * service[oc_id] action nothing (skipped due to action :nothing)
    * runit_service[oc_id] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/oc_id] action create (up to date)
      * template[/opt/opscode/sv/oc_id/run] action create (up to date)
      * directory[/opt/opscode/sv/oc_id/log] action create (up to date)
      * directory[/opt/opscode/sv/oc_id/log/main] action create (up to date)
      * directory[/var/log/oc_id] action create (up to date)
      * template[/opt/opscode/sv/oc_id/log/config] action create (up to date)
      * link[/var/log/oc_id/config] action create (up to date)
      * template[/opt/opscode/sv/oc_id/log/run] action create (up to date)
      * directory[/opt/opscode/sv/oc_id/env] action create (up to date)
      * ruby_block[Delete unmanaged env files for oc_id service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/oc_id/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/oc_id/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/oc_id/control] action create (up to date)
      * link[/opt/opscode/init/oc_id] action create (up to date)
      * file[/opt/opscode/sv/oc_id/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/oc_id] action create (up to date)
      * ruby_block[wait for oc_id service socket] action run
        - execute the ruby block wait for oc_id service socket
    
  
Recipe: private-chef::oc_id
  * directory[/var/opt/opscode/nginx/etc/addon.d] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/addon.d/40-oc_id_upstreams.conf] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/addon.d/40-oc_id_external.conf] action create (up to date)
Recipe: private-chef::elasticsearch
  * directory[/var/opt/opscode/elasticsearch] action create (up to date)
  * directory[/var/opt/opscode/elasticsearch/data] action create (up to date)
  * directory[/var/opt/opscode/elasticsearch/tmp] action create (up to date)
  * directory[/var/log/opscode/elasticsearch] action create (up to date)
  * directory[/var/opt/opscode/elasticsearch/config] action create (up to date)
  * directory[/var/opt/opscode/elasticsearch/plugins] action create (up to date)
  * directory[/var/opt/opscode/elasticsearch/scripts] action create (up to date)
  * execute[sysctl-reload] action nothing (skipped due to action :nothing)
  * file[/etc/sysctl.conf] action touch (skipped due to not_if)
  * sysctl[vm.max_map_count] action apply (up to date)
  * directory[/opt/opscode/service/elasticsearch/env] action delete
    - delete existing directory /opt/opscode/service/elasticsearch/env
  * template[/var/opt/opscode/elasticsearch/config/elasticsearch.yml] action create (up to date)
  * template[/var/opt/opscode/elasticsearch/config/logging.yml] action create (up to date)
  * template[/var/opt/opscode/elasticsearch/config/jvm.options] action create (up to date)
  * cookbook_file[/var/opt/opscode/elasticsearch/config/log4j2.properties] action create (up to date)
  * link[/opt/opscode/embedded/elasticsearch/config] action create (up to date)
  * component_runit_service[elasticsearch] action enable
    * template[/var/log/opscode/elasticsearch/config] action create (up to date)
  Recipe: <Dynamically Defined Resource>
    * service[elasticsearch] action nothing (skipped due to action :nothing)
    * runit_service[elasticsearch] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/elasticsearch] action create (up to date)
      * template[/opt/opscode/sv/elasticsearch/run] action create (up to date)
      * directory[/opt/opscode/sv/elasticsearch/log] action create (up to date)
      * directory[/opt/opscode/sv/elasticsearch/log/main] action create (up to date)
      * directory[/var/log/elasticsearch] action create (up to date)
      * template[/opt/opscode/sv/elasticsearch/log/config] action create (up to date)
      * link[/var/log/elasticsearch/config] action create (up to date)
      * template[/opt/opscode/sv/elasticsearch/log/run] action create (up to date)
      * directory[/opt/opscode/sv/elasticsearch/env] action create
        - create new directory /opt/opscode/sv/elasticsearch/env
        - change mode from '' to '0755'
        - restore selinux security context
      * ruby_block[Delete unmanaged env files for elasticsearch service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/elasticsearch/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/elasticsearch/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/elasticsearch/control] action create (up to date)
      * link[/opt/opscode/init/elasticsearch] action create (up to date)
      * file[/opt/opscode/sv/elasticsearch/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/elasticsearch] action create (up to date)
      * ruby_block[wait for elasticsearch service socket] action run
        - execute the ruby block wait for elasticsearch service socket
    
  
Recipe: private-chef::elasticsearch
  * component_runit_service[elasticsearch] action start
  Recipe: <Dynamically Defined Resource>
    * service[elasticsearch] action nothing (skipped due to action :nothing)
    * runit_service[elasticsearch] action start (up to date)
     (up to date)
Recipe: private-chef::elasticsearch_index
  * elasticsearch_index[chef] action create (up to date)
Recipe: private-chef::bookshelf
  * template[/opt/opscode/embedded/bin/cookbook_migration.sh] action create (up to date)
  * directory[/var/opt/opscode/bookshelf] action create (up to date)
  * directory[/var/log/opscode/bookshelf] action create (up to date)
  * directory[/var/log/opscode/bookshelf/sasl] action create (up to date)
  * directory[/var/opt/opscode/bookshelf/data] action create (up to date)
  * execute[cookbook migration] action run (skipped due to not_if)
  * link[/opt/opscode/embedded/service/bookshelf/log] action create (up to date)
  * template[/var/opt/opscode/bookshelf/sys.config] action create (up to date)
  * link[/opt/opscode/embedded/service/bookshelf/sys.config] action create (up to date)
  * template[/var/opt/opscode/bookshelf/vm.args] action create (up to date)
  * link[/opt/opscode/embedded/service/bookshelf/vm.args] action create (up to date)
  * component_runit_service[bookshelf] action enable
    * template[/var/log/opscode/bookshelf/config] action create (up to date)
  Recipe: <Dynamically Defined Resource>
    * service[bookshelf] action nothing (skipped due to action :nothing)
    * runit_service[bookshelf] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/bookshelf] action create (up to date)
      * template[/opt/opscode/sv/bookshelf/run] action create (up to date)
      * directory[/opt/opscode/sv/bookshelf/log] action create (up to date)
      * directory[/opt/opscode/sv/bookshelf/log/main] action create (up to date)
      * directory[/var/log/bookshelf] action create (up to date)
      * template[/opt/opscode/sv/bookshelf/log/config] action create (up to date)
      * link[/var/log/bookshelf/config] action create (up to date)
      * template[/opt/opscode/sv/bookshelf/log/run] action create (up to date)
      * directory[/opt/opscode/sv/bookshelf/env] action create (up to date)
      * ruby_block[Delete unmanaged env files for bookshelf service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/bookshelf/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/bookshelf/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/bookshelf/control] action create (up to date)
      * template[/opt/opscode/sv/bookshelf/control/t] action create (up to date)
      * link[/opt/opscode/init/bookshelf] action create (up to date)
      * file[/opt/opscode/sv/bookshelf/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/bookshelf] action create (up to date)
      * ruby_block[wait for bookshelf service socket] action run
        - execute the ruby block wait for bookshelf service socket
    
  
Recipe: private-chef::opscode-erchef
  * directory[/var/opt/opscode/opscode-erchef] action create (up to date)
  * directory[/var/log/opscode/opscode-erchef] action create (up to date)
  * directory[/var/log/opscode/opscode-erchef/sasl] action create (up to date)
  * link[/opt/opscode/embedded/service/opscode-erchef/log] action create (up to date)
  * template[/var/opt/opscode/opscode-erchef/sys.config] action create (up to date)
  * execute[remove_erchef_siz_files] action nothing (skipped due to action :nothing)
  * link[/opt/opscode/embedded/service/opscode-erchef/sys.config] action create (up to date)
  * template[/var/opt/opscode/opscode-erchef/vm.args] action create (up to date)
  * link[/opt/opscode/embedded/service/opscode-erchef/vm.args] action create (up to date)
  * component_runit_service[opscode-erchef] action enable
    * template[/var/log/opscode/opscode-erchef/config] action create (up to date)
  Recipe: <Dynamically Defined Resource>
    * service[opscode-erchef] action nothing (skipped due to action :nothing)
    * runit_service[opscode-erchef] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/opscode-erchef] action create (up to date)
      * template[/opt/opscode/sv/opscode-erchef/run] action create (up to date)
      * directory[/opt/opscode/sv/opscode-erchef/log] action create (up to date)
      * directory[/opt/opscode/sv/opscode-erchef/log/main] action create (up to date)
      * directory[/var/log/opscode-erchef] action create (up to date)
      * template[/opt/opscode/sv/opscode-erchef/log/config] action create (up to date)
      * link[/var/log/opscode-erchef/config] action create (up to date)
      * template[/opt/opscode/sv/opscode-erchef/log/run] action create (up to date)
      * directory[/opt/opscode/sv/opscode-erchef/env] action create (up to date)
      * ruby_block[Delete unmanaged env files for opscode-erchef service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/opscode-erchef/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/opscode-erchef/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/opscode-erchef/control] action create (up to date)
      * template[/opt/opscode/sv/opscode-erchef/control/t] action create (up to date)
      * link[/opt/opscode/init/opscode-erchef] action create (up to date)
      * file[/opt/opscode/sv/opscode-erchef/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/opscode-erchef] action create (up to date)
      * ruby_block[wait for opscode-erchef service socket] action run
        - execute the ruby block wait for opscode-erchef service socket
    
  
Recipe: private-chef::nginx
  * directory[/var/log/opscode/nginx] action create (up to date)
  * directory[/var/opt/opscode/nginx] action create (up to date)
  * directory[/var/opt/opscode/nginx/ca] action create (up to date)
  * directory[/var/opt/opscode/nginx/cache] action create (up to date)
  * directory[/var/opt/opscode/nginx/cache-tmp] action create (up to date)
  * directory[/var/opt/opscode/nginx/etc] action create (up to date)
  * directory[/var/opt/opscode/nginx/etc/addon.d] action create (up to date)
  * directory[/var/opt/opscode/nginx/etc/nginx.d] action create (up to date)
  * directory[/var/opt/opscode/nginx/etc/scripts] action create (up to date)
  * directory[/var/opt/opscode/nginx/html] action create (up to date)
  * directory[/var/opt/opscode/nginx/tmp] action create (up to date)
  * file[/var/log/opscode/nginx/access.log] action create (up to date)
  * file[/var/log/opscode/nginx/error.log] action create (up to date)
  * file[/var/log/opscode/nginx/current] action create (up to date)
  * openssl_x509_certificate[/var/opt/opscode/nginx/ca/rhel-chef-server.crt] action create
    * file[/var/opt/opscode/nginx/ca/rhel-chef-server.crt] action create_if_missing (up to date)
    * file[/var/opt/opscode/nginx/ca/rhel-chef-server.key] action create_if_missing (up to date)
     (up to date)
  * file[/var/opt/opscode/nginx/ca/rhel-chef-server.crt] action create (up to date)
  * file[/var/opt/opscode/nginx/ca/rhel-chef-server.key] action create (up to date)
  * openssl_dhparam[/var/opt/opscode/nginx/ca/dhparams.pem] action create
    * file[/var/opt/opscode/nginx/ca/dhparams.pem] action create (up to date)
     (up to date)
  * remote_directory[/var/opt/opscode/nginx/html] action create
  Recipe: <Dynamically Defined Resource>
    * cookbook_file[/var/opt/opscode/nginx/html/404.html] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/503.json] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/favicon.ico] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/index.html] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/css/all.css] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-blocks-b.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-blocks-t.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-body.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-close.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-footer.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-login-form-b.png] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-login-form-t.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-main-b.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-main-t.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-sidebar-title.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/btn-go.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/btn-more.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/btn-submit.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-about.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-blog-title.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-blog.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-friends.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-heading.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-next.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-platform.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-platform2-item.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-previous.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-subscribe.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bullet-subscribe2.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/hd-header.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/image.jpg] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/image2.jpg] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/image3.jpg] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/logo.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/logo.png] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/logo.svg] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/nav-active.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/nav-bg.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/nav-hover.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/photo.jpg] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/separator-blocks.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/separator-footer-bottom.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/separator-footer-list.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/separator-login.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/separator-post-info.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/upMenuArrow.png] action create (up to date)
     (up to date)
Recipe: private-chef::nginx
  * template[/var/opt/opscode/nginx/etc/scripts/config.lua] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/scripts/dispatch.lua] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/scripts/resolver.lua] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/scripts/route_checks.lua] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/scripts/routes.lua] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/scripts/dispatch_route.lua] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/scripts/validator.lua] action create (up to date)
  * file[/var/opt/opscode/nginx/stats_htpasswd] action create
    - update content in file /var/opt/opscode/nginx/stats_htpasswd from 19d1e5 to 32af83
    - suppressed sensitive resource
    - restore selinux security context
  * template[/var/opt/opscode/nginx/etc/chef_https_lb.conf] action create
    - update content in file /var/opt/opscode/nginx/etc/chef_https_lb.conf from 90aabd to 80a69d
    --- /var/opt/opscode/nginx/etc/chef_https_lb.conf	2024-02-25 00:12:01.760870785 +0530
    +++ /var/opt/opscode/nginx/etc/.chef-chef_https_lb20240225-8000-1mj1mh5.conf	2024-02-25 11:00:35.138940080 +0530
    @@ -30,10 +30,6 @@
         proxy_send_timeout      300;
         proxy_read_timeout      300;
     
    -      add_header X-Frame-Options DENY;
    -      add_header X-Content-Type-Options nosniff;
    -      add_header X-XSS-Protection 1;
    -      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";
     
         error_page 404 =404 /404.html;
         error_page 503 =503 /503.json;
    - restore selinux security context
  * template[/var/opt/opscode/nginx/etc/chef_http_lb.conf] action create
    - update content in file /var/opt/opscode/nginx/etc/chef_http_lb.conf from d989f7 to fd6ea3
    --- /var/opt/opscode/nginx/etc/chef_http_lb.conf	2024-02-25 00:12:01.799870783 +0530
    +++ /var/opt/opscode/nginx/etc/.chef-chef_http_lb20240225-8000-1r35mx4.conf	2024-02-25 11:00:35.186940079 +0530
    @@ -20,9 +20,6 @@
         proxy_send_timeout      300;
         proxy_read_timeout      300;
     
    -      add_header X-Frame-Options DENY;
    -      add_header X-Content-Type-Options nosniff;
    -      add_header X-XSS-Protection 1;
     
         error_page 404 =404 /404.html;
         error_page 503 =503 /503.json;
    - restore selinux security context
  * template[/var/opt/opscode/nginx/etc/nginx.conf] action create (up to date)
  * cookbook_file[/var/opt/opscode/nginx/etc/addon.d/README.md] action create (up to date)
  * component_runit_service[nginx] action enable
    * template[/var/log/opscode/nginx/config] action create (up to date)
  Recipe: <Dynamically Defined Resource>
    * service[nginx] action nothing (skipped due to action :nothing)
    * runit_service[nginx] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/nginx] action create (up to date)
      * template[/opt/opscode/sv/nginx/run] action create (up to date)
      * directory[/opt/opscode/sv/nginx/log] action create (up to date)
      * directory[/opt/opscode/sv/nginx/log/main] action create (up to date)
      * directory[/var/log/nginx] action create (up to date)
      * template[/opt/opscode/sv/nginx/log/config] action create (up to date)
      * link[/var/log/nginx/config] action create (up to date)
      * template[/opt/opscode/sv/nginx/log/run] action create (up to date)
      * directory[/opt/opscode/sv/nginx/env] action create (up to date)
      * ruby_block[Delete unmanaged env files for nginx service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/nginx/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/nginx/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/nginx/control] action create (up to date)
      * link[/opt/opscode/init/nginx] action create (up to date)
      * file[/opt/opscode/sv/nginx/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/nginx] action create (up to date)
      * ruby_block[wait for nginx service socket] action run
        - execute the ruby block wait for nginx service socket
    
  
Recipe: private-chef::nginx
  * component_runit_service[nginx] action start
  Recipe: <Dynamically Defined Resource>
    * service[nginx] action nothing (skipped due to action :nothing)
    * runit_service[nginx] action start (up to date)
     (up to date)
Recipe: private-chef::nginx
  * template[/etc/opscode/logrotate.d/nginx] action create (up to date)
Recipe: private-chef::opscode-chef-mover
  * directory[/var/opt/opscode/opscode-chef-mover] action create (up to date)
  * directory[/var/opt/opscode/opscode-chef-mover/etc] action create (up to date)
  * directory[/var/opt/opscode/opscode-chef-mover/data] action create (up to date)
  * directory[/var/log/opscode/opscode-chef-mover] action create (up to date)
  * directory[/var/log/opscode/opscode-chef-mover/sasl] action create (up to date)
  * link[/opt/opscode/embedded/service/opscode-chef-mover/log] action create (up to date)
  * template[/var/opt/opscode/opscode-chef-mover/sys.config] action create (up to date)
  * link[/opt/opscode/embedded/service/opscode-chef-mover/sys.config] action create (up to date)
  * template[/var/opt/opscode/opscode-chef-mover/vm.args] action create (up to date)
  * link[/opt/opscode/embedded/service/opscode-chef-mover/vm.args] action create (up to date)
  * component_runit_service[opscode-chef-mover] action down
  Recipe: <Dynamically Defined Resource>
    * service[opscode-chef-mover] action nothing (skipped due to action :nothing)
    * runit_service[opscode-chef-mover] action stop (up to date)
     (up to date)
Recipe: private-chef::redis_lb
  * directory[/var/opt/opscode/redis_lb] action create (up to date)
  * directory[/var/opt/opscode/redis_lb/etc] action create (up to date)
  * directory[/var/opt/opscode/redis_lb/data] action create (up to date)
  * directory[/var/log/opscode/redis_lb] action create (up to date)
  * link[/var/opt/opscode/redis_lb/data] action create (skipped due to not_if)
  * template[/var/opt/opscode/redis_lb/etc/redis.conf] action create (up to date)
  * component_runit_service[redis_lb] action enable
    * template[/var/log/opscode/redis_lb/config] action create (up to date)
    * runit_service[redis_lb] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/sv/redis_lb] action create (up to date)
      * template[/opt/opscode/sv/redis_lb/run] action create (up to date)
      * directory[/opt/opscode/sv/redis_lb/log] action create (up to date)
      * directory[/opt/opscode/sv/redis_lb/log/main] action create (up to date)
      * directory[/var/log/redis_lb] action create (up to date)
      * template[/opt/opscode/sv/redis_lb/log/config] action create (up to date)
      * link[/var/log/redis_lb/config] action create (up to date)
      * template[/opt/opscode/sv/redis_lb/log/run] action create (up to date)
      * directory[/opt/opscode/sv/redis_lb/env] action create (up to date)
      * ruby_block[Delete unmanaged env files for redis_lb service] action run (skipped due to only_if)
      * template[/opt/opscode/sv/redis_lb/check] action create (skipped due to only_if)
      * template[/opt/opscode/sv/redis_lb/finish] action create (skipped due to only_if)
      * directory[/opt/opscode/sv/redis_lb/control] action create (up to date)
      * link[/opt/opscode/init/redis_lb] action create (up to date)
      * file[/opt/opscode/sv/redis_lb/down] action nothing (skipped due to action :nothing)
      * directory[/opt/opscode/service] action create (up to date)
      * link[/opt/opscode/service/redis_lb] action create (up to date)
      * ruby_block[wait for redis_lb service socket] action run
        - execute the ruby block wait for redis_lb service socket
    
  
  * service[redis_lb] action nothing (skipped due to action :nothing)
  * runit_service[redis_lb] action restart (up to date)
  * template[/etc/opscode/logrotate.d/redis_lb] action create (up to date)
  * ruby_block[set_lb_redis_values] action run
    - execute the ruby block set_lb_redis_values
Recipe: private-chef::cleanup
  * service[postgres] action nothing (skipped due to action :nothing)
  * runit_service[postgres] action stop (up to date)
  * runit_service[postgres] action disable
    * ruby_block[disable postgres] action run (skipped due to only_if)
     (up to date)
  * directory[/opt/opscode/sv/postgres] action delete (up to date)
  * directory[/opt/opscode/embedded/service/chef-server-bootstrap] action delete (up to date)
  * service[opscode-expander-reindexer] action nothing (skipped due to action :nothing)
  * runit_service[opscode-expander-reindexer] action stop (up to date)
  * runit_service[opscode-expander-reindexer] action disable
    * ruby_block[disable opscode-expander-reindexer] action run (skipped due to only_if)
     (up to date)
  * link[/opt/opscode/init/opscode-expander-reindexer] action delete (up to date)
  * directory[/opt/opscode/sv/opscode-expander-reindexer] action delete (up to date)
  * component_runit_service[opscode-expander] action disable
  Recipe: <Dynamically Defined Resource>
    * service[opscode-expander] action nothing (skipped due to action :nothing)
    * runit_service[opscode-expander] action disable
      * ruby_block[disable opscode-expander] action run (skipped due to only_if)
       (up to date)
     (up to date)
Recipe: private-chef::cleanup
  * directory[/opt/opscode/sv/opscode-expander] action delete (up to date)
  * component_runit_service[opscode-solr4] action disable
  Recipe: <Dynamically Defined Resource>
    * service[opscode-solr4] action nothing (skipped due to action :nothing)
    * runit_service[opscode-solr4] action disable
      * ruby_block[disable opscode-solr4] action run (skipped due to only_if)
       (up to date)
     (up to date)
Recipe: private-chef::cleanup
  * directory[/opt/opscode/sv/opscode-solr4] action delete (up to date)
  * component_runit_service[rabbitmq] action disable
  Recipe: <Dynamically Defined Resource>
    * service[rabbitmq] action nothing (skipped due to action :nothing)
    * runit_service[rabbitmq] action disable
      * ruby_block[disable rabbitmq] action run (skipped due to only_if)
       (up to date)
     (up to date)
Recipe: private-chef::cleanup
  * directory[/opt/opscode/sv/rabbitmq] action delete (up to date)
Recipe: private-chef::remove_actions
  * file[/etc/opscode-analytics/webui_priv.pem] action delete (up to date)
  * file[/etc/opscode-analytics/actions-source.json] action delete (up to date)
Recipe: private-chef::private-chef-sh
  * template[/etc/opscode/private-chef.sh] action create (up to date)
Recipe: private-chef::oc-chef-pedant
  * directory[/var/opt/opscode/oc-chef-pedant] action create (up to date)
  * directory[/var/opt/opscode/oc-chef-pedant/etc] action create (up to date)
  * directory[/var/log/opscode/oc-chef-pedant] action create (up to date)
  * template[/var/opt/opscode/oc-chef-pedant/etc/pedant_config.rb] action create (up to date)
Recipe: private-chef::log_cleanup
  * cron_d[opc_log_cleanup] action delete
    * file[legacy named cron.d file] action delete (up to date)
    * file[/etc/cron.d/opc_log_cleanup] action delete (up to date)
     (up to date)
  * cron_d[opc_logrotate.cron] action delete
    * file[legacy named cron.d file] action delete (up to date)
    * file[/etc/cron.d/opc_logrotate-cron] action delete (up to date)
     (up to date)
  * template[/etc/opscode/logrotate.conf] action create (up to date)
  * template[/etc/cron.hourly/opc_logrotate] action create (up to date)
Recipe: private-chef::partybus
  * directory[/var/opt/opscode/upgrades] action create (up to date)
  * directory[/var/opt/opscode/upgrades/etc] action create (up to date)
  * directory[/opt/opscode/embedded/service/partybus] action create (up to date)
  * template[/var/opt/opscode/upgrades/etc/config.rb] action create (up to date)
  * link[/opt/opscode/embedded/service/partybus/config.rb] action create (up to date)
  * execute[set initial migration level] action nothing (skipped due to action :nothing)
  * ruby_block[migration-level file check] action nothing (skipped due to action :nothing)
Recipe: private-chef::ctl_config
  * template[/etc/opscode/pivotal.rb] action create (up to date)
Recipe: private-chef::default
  * file[/etc/opscode/chef-server-running.json] action create
    - update content in file /etc/opscode/chef-server-running.json from 444e65 to 90bf3a
    --- /etc/opscode/chef-server-running.json	2024-02-25 00:12:13.693870055 +0530
    +++ /etc/opscode/.chef-chef-server-running20240225-8000-1odew6.json	2024-02-25 11:00:36.201940076 +0530
    @@ -543,7 +543,7 @@
           "solr_ibrowse_options": "[{connect_timeout, 10000}]"
         },
         "bootstrap": {
    -      "enable": true
    +      "enable": false
         },
         "estatsd": {
           "enable": true,
    - restore selinux security context
  * ruby_block[print reconfigure warnings] action run
    - execute the ruby block print reconfigure warnings
Recipe: private-chef::nginx
  * component_runit_service[nginx] action restart
  Recipe: <Dynamically Defined Resource>
    * service[nginx] action nothing (skipped due to action :nothing)
    * runit_service[nginx] action restart (up to date)
     (up to date)

Running handlers:
Running handlers complete
Chef Infra Client finished, 44/494 resources updated in 21 seconds
Chef Server Reconfigured!

[root@rhel-chef-server ~]# chef-manage-ctl reconfigure
Chef Infra Client, version 17.5.22
Patents: https://www.chef.io/patents
Infra Phase starting
Resolving cookbooks for run list: ["omnibus-chef-manage::default"]
Synchronizing cookbooks:
  - chef-server-ingredient (0.5.2)
  - omnibus-chef-manage (1.0.0)
  - enterprise (1.2.0)
  - private_chef_addon (0.2.0)
  - packagecloud (2.0.6)
  - runit (5.1.7)
  - unicorn (3.0.0)
  - chef-ingredient (0.11.3)
  - apt-chef (3.0.0)
  - yum-epel (5.0.6)
  - yum-chef (4.0.0)
Installing cookbook gem dependencies:
Compiling cookbooks...
Loading Chef InSpec profile files:
Loading Chef InSpec input files:
Loading Chef InSpec waiver files:
Recipe: omnibus-chef-manage::default
  * private_chef_addon[chef-manage] action create
    * directory[/opt/chef-manage] action create
      - change mode from '0755' to '0775'
      - restore selinux security context
    * directory[/var/opt/chef-manage] action create
      - create new directory /var/opt/chef-manage
      - change mode from '' to '0775'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
    * directory[/var/opt/chef-manage/etc] action create
      - create new directory /var/opt/chef-manage/etc
      - change mode from '' to '0775'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
    * directory[/var/opt/chef-manage/tmp] action create
      - create new directory /var/opt/chef-manage/tmp
      - change mode from '' to '0775'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
    * directory[/var/log/chef-manage] action create
      - create new directory /var/log/chef-manage
      - change mode from '' to '0775'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
    * linux_user[opscode] action create (up to date)
    * group[opscode] action create (up to date)
    * directory[/var/log/chef-manage/web] action create
      - create new directory /var/log/chef-manage/web
      - change mode from '' to '0700'
      - change owner from '' to 'opscode'
      - restore selinux security context
    * directory[/var/log/chef-manage/worker] action create
      - create new directory /var/log/chef-manage/worker
      - change mode from '' to '0700'
      - change owner from '' to 'opscode'
      - restore selinux security context
  
Recipe: omnibus-chef-manage::config
  * directory[/etc/chef-manage] action create
    - create new directory /etc/chef-manage
    - change mode from '' to '0700'
    - change owner from '' to 'opscode'
    - restore selinux security context
  Converging 36 resources
Recipe: omnibus-chef-manage::default
  * directory[/opt/chef-manage/embedded/cookbooks/local-mode-cache] action delete (up to date)
  * private_chef_addon[chef-manage] action nothing (skipped due to action :nothing)
  * component_runit_supervisor[opscode-manage] action delete
    * execute[systemctl daemon-reload] action nothing (skipped due to action :nothing)
    * service[opscode-manage-runsvdir-start.service] action stop (up to date)
    * service[opscode-manage-runsvdir-start.service] action disable (up to date)
    * file[/etc/systemd/system/opscode-manage-runsvdir-start.service] action delete (up to date)
     (up to date)
Recipe: enterprise::runit
  * component_runit_supervisor[chef-manage] action create
    * template[/etc/systemd/system/chef-manage-runsvdir-start.service] action create
      - create new file /etc/systemd/system/chef-manage-runsvdir-start.service
      - update content in file /etc/systemd/system/chef-manage-runsvdir-start.service from none to 7f3415
      --- /etc/systemd/system/chef-manage-runsvdir-start.service	2024-02-25 11:02:23.204939667 +0530
      +++ /etc/systemd/system/.chef-chef-manage-runsvdir-start20240225-21931-mrq8fo.service	2024-02-25 11:02:23.204939667 +0530
      @@ -1 +1,13 @@
      +[Unit]
      +Description=chef-manage Runit Process Supervisor
      +After=network.target auditd.service
      +
      +[Service]
      +ExecStart=/opt/chef-manage/embedded/bin/runsvdir-start
      +Restart=always
      +# only valid for systemd >= 228
      +TasksMax=infinity
      +
      +[Install]
      +WantedBy=multi-user.target
      - change mode from '' to '0644'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
    * execute[systemctl daemon-reload] action nothing (skipped due to action :nothing)
    * execute[systemctl daemon-reload] action run
      - execute systemctl daemon-reload
    * file[/usr/lib/systemd/system/chef-manage-runsvdir-start.service] action delete (up to date)
    * service[chef-manage-runsvdir-start.service] action enable
      - enable service service[chef-manage-runsvdir-start.service]
    * service[chef-manage-runsvdir-start.service] action start
      - start service service[chef-manage-runsvdir-start.service]
  
Recipe: omnibus-chef-manage::config
  * directory[/etc/chef-manage] action create (up to date)
  * private_chef_addon[chef-manage] action create
    * directory[/opt/chef-manage] action create (up to date)
    * directory[/var/opt/chef-manage] action create (up to date)
    * directory[/var/opt/chef-manage/etc] action create (up to date)
    * directory[/var/opt/chef-manage/tmp] action create (up to date)
    * directory[/var/log/chef-manage] action create (up to date)
    * linux_user[opscode] action create
      - alter user opscode
      - change shell from /usr/sbin/nologin to /bin/sh
    * group[opscode] action create (up to date)
    * directory[/var/log/chef-manage/web] action create (up to date)
    * directory[/var/log/chef-manage/worker] action create (up to date)
    * directory[/var/log/chef-manage/events] action create
      - create new directory /var/log/chef-manage/events
      - change mode from '' to '0700'
      - change owner from '' to 'opscode'
      - restore selinux security context
  
  * file[/var/opt/chef-manage/etc/newrelic.yml] action create
    - create new file /var/opt/chef-manage/etc/newrelic.yml
    - update content in file /var/opt/chef-manage/etc/newrelic.yml from none to 910d34
    --- /var/opt/chef-manage/etc/newrelic.yml	2024-02-25 11:02:24.038939664 +0530
    +++ /var/opt/chef-manage/etc/.chef-newrelic20240225-21931-u5ljvc.yml	2024-02-25 11:02:24.038939664 +0530
    @@ -1 +1,6 @@
    +---
    +development:
    +  monitor_mode: false
    +production:
    +  monitor_mode: false
    - change mode from '' to '0600'
    - change owner from '' to 'opscode'
    - restore selinux security context
  * file[/var/opt/chef-manage/etc/settings.yml] action create
    - create new file /var/opt/chef-manage/etc/settings.yml
    - update content in file /var/opt/chef-manage/etc/settings.yml from none to f00ee4
    --- /var/opt/chef-manage/etc/settings.yml	2024-02-25 11:02:24.084939664 +0530
    +++ /var/opt/chef-manage/etc/.chef-settings20240225-21931-58epcx.yml	2024-02-25 11:02:24.084939664 +0530
    @@ -1 +1,111 @@
    +---
    +sysvinit_id: CM
    +chef_base_path: "/opt/opscode"
    +install_path: "/opt/chef-manage"
    +var_path: "/var/opt/chef-manage"
    +config_path: "/var/opt/chef-manage/etc"
    +log_path: "/var/log/chef-manage"
    +tmp_path: "/var/opt/chef-manage/tmp"
    +web:
    +  log_directory: "/var/log/chef-manage/web"
    +  log_rotation:
    +    file_maxbytes: 104857600
    +    num_to_keep: 10
    +worker:
    +  log_directory: "/var/log/chef-manage/worker"
    +  log_rotation:
    +    file_maxbytes: 104857600
    +    num_to_keep: 10
    +redis:
    +  log_directory: "/var/log/chef-manage/redis"
    +  log_rotation:
    +    file_maxbytes: 104857600
    +    num_to_keep: 10
    +  host: localhost
    +  port: 11002
    +  url: redis://localhost:11002/0
    +services:
    +  web:
    +    enable: true
    +  worker:
    +    enable: true
    +  events: {}
    +webapp:
    +  worker_processes: 4
    +  port: 9462
    +  listen: 127.0.0.1:9462
    +  backlog: 1024
    +  tcp_nodelay: true
    +  worker_timeout: 3600
    +  min_request: 3072
    +  max_request: 4096
    +  min_memory: 120
    +  max_memory: 150
    +ssl_verify_mode: verify_none
    +trusted_certs_dir: ''
    +ssl_client_cert: ''
    +ssl_client_key: ''
    +ssl_ca_file: ''
    +user:
    +  username: opscode
    +  shell: "/bin/sh"
    +  home: "/opt/opscode/embedded"
    +fqdn: rhel-chef-server
    +chef_server_external_url: https://rhel-chef-server
    +chef_server_internal_url: https://localhost
    +origin: rhel-chef-server
    +public_port: 443
    +ldap:
    +  enabled: false
    +  adjective:
    +external:
    +  port: 443
    +platform:
    +  public_url: https://rhel-chef-server
    +  url: https://localhost
    +  user: pivotal
    +backbone_paginator_timeout: 120000
    +chef_documentation_url: https://docs.chef.io
    +disable_sign_up: false
    +email_from_address: Chef Notifications <notifications@chef.io>
    +nginx_addon_prefix: 30
    +org_creation_enabled: true
    +runit_timeout: 30
    +session_timeout: 1440
    +session_timeout_absolute: 10080
    +max_login_failures: 7
    +support_email_address: support@chef.io
    +support_site_url: https://chef.io/support
    +support_tickets_url: https://getchef.zendesk.com/hc/en-us/requests/new
    +chef_title: Chef Infra
    +disable_upgrade_banner: false
    +air_gapped: false
    +events: {}
    +google_analytics: {}
    +logging:
    +  chef_log_level: info
    +  log_level: info
    +marketo: {}
    +eloqua: {}
    +saml:
    +  enabled: false
    +  issuer_url: http://delivery/api/v0
    +  verify_tls: true
    +  adjective: SAML
    +recaptcha:
    +  enabled: false
    +  fail_open: true
    +  verify_url: https://www.google.com/recaptcha/api/siteverify
    +sentry: {}
    +secrets:
    +  provider: chef-secrets-env
    +  var_name: CHEF_SECRETS_DATA
    +marketplace:
    +  sign_up:
    +    enabled: false
    +    timeout: 3600
    +  sentinel:
    +    file: "/var/opt/chef-manage/marketplace_sentinel"
    +onetrust:
    +  enabled: false
    - change mode from '' to '0600'
    - change owner from '' to 'opscode'
    - restore selinux security context
  * link[/opt/chef-manage/embedded/service/chef-manage/config/settings/production.yml] action create
    - create symlink at /opt/chef-manage/embedded/service/chef-manage/config/settings/production.yml to /var/opt/chef-manage/etc/settings.yml
  * link[/opt/chef-manage/embedded/service/chef-manage/config/newrelic.yml] action create
    - create symlink at /opt/chef-manage/embedded/service/chef-manage/config/newrelic.yml to /var/opt/chef-manage/etc/newrelic.yml
  * link[/opt/chef-manage/embedded/service/chef-manage/tmp] action create
    - create symlink at /opt/chef-manage/embedded/service/chef-manage/tmp to /var/opt/chef-manage/tmp
  * directory[/var/opt/chef-manage/run] action create
    - create new directory /var/opt/chef-manage/run
    - change mode from '' to '0700'
    - change owner from '' to 'opscode'
    - restore selinux security context
Recipe: omnibus-chef-manage::redis
  * directory[/var/opt/chef-manage/lib/redis] action create
    - create new directory /var/opt/chef-manage/lib/redis
    - change mode from '' to '0700'
    - change owner from '' to 'opscode'
    - restore selinux security context
  * directory[/var/log/chef-manage/redis] action create
    - create new directory /var/log/chef-manage/redis
    - change mode from '' to '0700'
    - change owner from '' to 'opscode'
    - restore selinux security context
  * template[/var/opt/chef-manage/etc/redis.conf] action create
    - create new file /var/opt/chef-manage/etc/redis.conf
    - update content in file /var/opt/chef-manage/etc/redis.conf from none to 616508
    --- /var/opt/chef-manage/etc/redis.conf	2024-02-25 11:02:24.219939664 +0530
    +++ /var/opt/chef-manage/etc/.chef-redis20240225-21931-u36348.conf	2024-02-25 11:02:24.219939664 +0530
    @@ -1 +1,10 @@
    +# Redis configuration for chef-manage
    +#
    +# Generated by chef-manage-ctl reconfigure
    +
    +pidfile /var/opt/chef-manage/run/redis.pid
    +port 11002
    +bind 127.0.0.1
    +loglevel notice
    +dir /var/opt/chef-manage/lib/redis
    - change mode from '' to '0600'
    - change owner from '' to 'opscode'
    - restore selinux security context
  * component_runit_service[redis] action enable
    * template[/var/log/chef-manage/redis/config] action create
      - create new file /var/log/chef-manage/redis/config
      - update content in file /var/log/chef-manage/redis/config from none to 5e16ac
      --- /var/log/chef-manage/redis/config	2024-02-25 11:02:24.268939663 +0530
      +++ /var/log/chef-manage/redis/.chef-config20240225-21931-l826ts	2024-02-25 11:02:24.268939663 +0530
      @@ -1 +1,4 @@
      +# svlogd configuration
      +s104857600
      +n10
      - change mode from '' to '0644'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
  Recipe: <Dynamically Defined Resource>
    * service[redis] action nothing (skipped due to action :nothing)
    * runit_service[redis] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/chef-manage/sv/redis] action create
        - create new directory /opt/chef-manage/sv/redis
        - change mode from '' to '0755'
        - restore selinux security context
      * template[/opt/chef-manage/sv/redis/run] action create
        - create new file /opt/chef-manage/sv/redis/run
        - update content in file /opt/chef-manage/sv/redis/run from none to 26c157
        --- /opt/chef-manage/sv/redis/run	2024-02-25 11:02:24.347939663 +0530
        +++ /opt/chef-manage/sv/redis/.chef-run20240225-21931-id5xqt	2024-02-25 11:02:24.347939663 +0530
        @@ -1 +1,11 @@
        +#!/bin/sh
        +
        +exec 2>&1
        +exec /opt/chef-manage/embedded/bin/chpst \
        +  -P \
        +  -U opscode \
        +  -u opscode \
        +  env \
        +  PATH=/opt/chef-manage/embedded/bin:$PATH \
        +  redis-server /var/opt/chef-manage/etc/redis.conf
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/opt/chef-manage/sv/redis/log] action create
        - create new directory /opt/chef-manage/sv/redis/log
        - restore selinux security context
      * directory[/opt/chef-manage/sv/redis/log/main] action create
        - create new directory /opt/chef-manage/sv/redis/log/main
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/var/log/redis] action create
        - create new directory /var/log/redis
        - change mode from '' to '0755'
        - restore selinux security context
      * template[/opt/chef-manage/sv/redis/log/config] action create
        - create new file /opt/chef-manage/sv/redis/log/config
        - update content in file /opt/chef-manage/sv/redis/log/config from none to e3b0c4
        (no diff)
        - change mode from '' to '0644'
        - restore selinux security context
      * link[/var/log/redis/config] action create
        - create symlink at /var/log/redis/config to /opt/chef-manage/sv/redis/log/config
      * template[/opt/chef-manage/sv/redis/log/run] action create
        - create new file /opt/chef-manage/sv/redis/log/run
        - update content in file /opt/chef-manage/sv/redis/log/run from none to 383757
        --- /opt/chef-manage/sv/redis/log/run	2024-02-25 11:02:24.528939662 +0530
        +++ /opt/chef-manage/sv/redis/log/.chef-run20240225-21931-yw67d4	2024-02-25 11:02:24.528939662 +0530
        @@ -1 +1,4 @@
        +#!/bin/sh
        +exec /opt/chef-manage/embedded/bin/svlogd \
        +  -tt /var/log/chef-manage/redis
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/opt/chef-manage/sv/redis/env] action create
        - create new directory /opt/chef-manage/sv/redis/env
        - change mode from '' to '0755'
        - restore selinux security context
      * ruby_block[Delete unmanaged env files for redis service] action run (skipped due to only_if)
      * template[/opt/chef-manage/sv/redis/check] action create (skipped due to only_if)
      * template[/opt/chef-manage/sv/redis/finish] action create (skipped due to only_if)
      * directory[/opt/chef-manage/sv/redis/control] action create
        - create new directory /opt/chef-manage/sv/redis/control
        - change mode from '' to '0755'
        - restore selinux security context
      * link[/opt/chef-manage/init/redis] action create
        - create symlink at /opt/chef-manage/init/redis to /opt/chef-manage/embedded/bin/sv
      * file[/opt/chef-manage/sv/redis/down] action nothing (skipped due to action :nothing)
      * ruby_block[restart_service] action run
        * ruby_block[restart_service] action nothing (skipped due to action :nothing)
        * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/sv/redis] action create (up to date)
        * template[/opt/chef-manage/sv/redis/run] action create (up to date)
        * directory[/opt/chef-manage/sv/redis/log] action create (up to date)
        * directory[/opt/chef-manage/sv/redis/log/main] action create (up to date)
        * directory[/var/log/redis] action create (up to date)
        * template[/opt/chef-manage/sv/redis/log/config] action create (up to date)
        * link[/var/log/redis/config] action create (up to date)
        * template[/opt/chef-manage/sv/redis/log/run] action create (up to date)
        * directory[/opt/chef-manage/sv/redis/env] action create (up to date)
        * ruby_block[Delete unmanaged env files for redis service] action run (skipped due to only_if)
        * template[/opt/chef-manage/sv/redis/check] action create (skipped due to only_if)
        * template[/opt/chef-manage/sv/redis/finish] action create (skipped due to only_if)
        * directory[/opt/chef-manage/sv/redis/control] action create (up to date)
        * link[/opt/chef-manage/init/redis] action create (up to date)
        * file[/opt/chef-manage/sv/redis/down] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/service] action create (up to date)
        * link[/opt/chef-manage/service/redis] action create
          - create symlink at /opt/chef-manage/service/redis to /opt/chef-manage/sv/redis
        * ruby_block[wait for redis service socket] action run
          - execute the ruby block wait for redis service socket
        - execute the ruby block restart_service
      * ruby_block[restart_log_service] action run
        * ruby_block[restart_service] action nothing (skipped due to action :nothing)
        * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/sv/redis] action create (up to date)
        * template[/opt/chef-manage/sv/redis/run] action create (up to date)
        * directory[/opt/chef-manage/sv/redis/log] action create (up to date)
        * directory[/opt/chef-manage/sv/redis/log/main] action create (up to date)
        * directory[/var/log/redis] action create (up to date)
        * template[/opt/chef-manage/sv/redis/log/config] action create (up to date)
        * link[/var/log/redis/config] action create (up to date)
        * template[/opt/chef-manage/sv/redis/log/run] action create (up to date)
        * directory[/opt/chef-manage/sv/redis/env] action create (up to date)
        * ruby_block[Delete unmanaged env files for redis service] action run (skipped due to only_if)
        * template[/opt/chef-manage/sv/redis/check] action create (skipped due to only_if)
        * template[/opt/chef-manage/sv/redis/finish] action create (skipped due to only_if)
        * directory[/opt/chef-manage/sv/redis/control] action create (up to date)
        * link[/opt/chef-manage/init/redis] action create (up to date)
        * file[/opt/chef-manage/sv/redis/down] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/service] action create (up to date)
        * link[/opt/chef-manage/service/redis] action create (up to date)
        * ruby_block[wait for redis service socket] action run
          - execute the ruby block wait for redis service socket
        - execute the ruby block restart_log_service
      * directory[/opt/chef-manage/service] action create (up to date)
      * link[/opt/chef-manage/service/redis] action create (up to date)
      * ruby_block[wait for redis service socket] action run
        - execute the ruby block wait for redis service socket
    
    * runit_service[redis] action reload_log
      - reload log service
  
Recipe: omnibus-chef-manage::web
  * directory[/var/opt/chef-manage/etc] action create (up to date)
  * template[/var/opt/chef-manage/etc/unicorn.rb] action create
    - create new file /var/opt/chef-manage/etc/unicorn.rb
    - update content in file /var/opt/chef-manage/etc/unicorn.rb from none to e94618
    --- /var/opt/chef-manage/etc/unicorn.rb	2024-02-25 11:02:31.547939636 +0530
    +++ /var/opt/chef-manage/etc/.chef-unicorn20240225-21931-gv6p7x.rb	2024-02-25 11:02:31.547939636 +0530
    @@ -1 +1,35 @@
    +##
    +# Unicorn config at /var/opt/chef-manage/etc/unicorn.rb
    +# Managed by Chef - Local Changes will be Nuked from Orbit (just to be sure)
    +##
    +
    +# What ports/sockets to listen on, and what options for them.
    +listen "127.0.0.1:9462", {:backlog=>1024, :tcp_nodelay=>true}
    +
    +
    +# What the timeout for killing busy workers is, in seconds
    +timeout 3600
    +
    +# Whether the app should be pre-loaded
    +preload_app true
    +
    +# How many worker processes
    +worker_processes 4
    +
    +
    +
    +
    +# What to do after we fork a worker
    +after_fork do |server, worker|
    +  
    +  Sidekiq.configure_server do |config|
    +    config.redis = { :url => 'redis://localhost:11002/0' }
    +  end
    +  Sidekiq.configure_client do |config|
    +    config.redis = { :url => 'redis://localhost:11002/0' }
    +  end
    +  
    +end
    +
    +
    - change mode from '' to '0600'
    - change owner from '' to 'opscode'
    - restore selinux security context
  * ruby_block[warn-group-no-user] action run (skipped due to only_if)
  * template[/opt/chef-manage/embedded/service/chef-manage/config.ru] action create
    - update content in file /opt/chef-manage/embedded/service/chef-manage/config.ru from 257c24 to a4b801
    --- /opt/chef-manage/embedded/service/chef-manage/config.ru	2024-01-24 20:23:10.000000000 +0530
    +++ /opt/chef-manage/embedded/service/chef-manage/.chef-config20240225-21931-eixawp.ru	2024-02-25 11:02:31.593939635 +0530
    @@ -1,4 +1,23 @@
    -# This file is overwritten by omnibus-chef-manage::web recipe
    +# Chef Management Console config.ru is used by Rack-based servers to start
    +# the application.
    +#
    +# Generated by chef-manage-ctl reconfigure
    +
    +if defined?(Unicorn)
    +  require 'unicorn/worker_killer'
    +
    +  min_request = 3072
    +  max_request = 4096
    +
    +  # Max requests per worker
    +  use Unicorn::WorkerKiller::MaxRequests, min_request, max_request
    +
    +  min_memory = 125829120
    +  max_memory = 157286400
    +
    +  # Max memory size in bytes per worker
    +  use Unicorn::WorkerKiller::Oom, min_memory, max_memory
    +end
     
     require ::File.expand_path('../config/environment',  __FILE__)
     
    - change owner from 'root' to 'opscode'
    - restore selinux security context
  * component_runit_service[web] action enable
    * template[/var/log/chef-manage/web/config] action create
      - create new file /var/log/chef-manage/web/config
      - update content in file /var/log/chef-manage/web/config from none to 5e16ac
      --- /var/log/chef-manage/web/config	2024-02-25 11:02:31.635939635 +0530
      +++ /var/log/chef-manage/web/.chef-config20240225-21931-g3j846	2024-02-25 11:02:31.635939635 +0530
      @@ -1 +1,4 @@
      +# svlogd configuration
      +s104857600
      +n10
      - change mode from '' to '0644'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
  Recipe: <Dynamically Defined Resource>
    * service[web] action nothing (skipped due to action :nothing)
    * runit_service[web] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/chef-manage/sv/web] action create
        - create new directory /opt/chef-manage/sv/web
        - change mode from '' to '0755'
        - restore selinux security context
      * template[/opt/chef-manage/sv/web/run] action create
        - create new file /opt/chef-manage/sv/web/run
        - update content in file /opt/chef-manage/sv/web/run from none to f01af4
        --- /opt/chef-manage/sv/web/run	2024-02-25 11:02:31.717939635 +0530
        +++ /opt/chef-manage/sv/web/.chef-run20240225-21931-h2wxlf	2024-02-25 11:02:31.717939635 +0530
        @@ -1 +1,23 @@
        +#!/bin/sh
        +export DIR=/opt/chef-manage/embedded/service/chef-manage
        +export SVWAIT=30
        +export PATH=/opt/chef-manage/embedded/bin:$PATH
        +export HOME=$DIR
        +
        +cd $DIR
        +exec 2>&1
        +exec veil-env-helper --pack -s manage.secret_token \
        +                            -s manage.secret_key_base \
        +                            -s chef-server.webui_key \
        +                            -o saml.client_id \
        +                            -o saml.client_secret \
        +                            -o recaptcha.site_key \
        +                            -o recaptcha.secret_key \
        +  -- /opt/chef-manage/embedded/bin/chpst \
        +  -P \
        +  -U opscode \
        +  -u opscode \
        +    bundle exec unicorn -E production \
        +      -c /var/opt/chef-manage/etc/unicorn.rb \
        +      /opt/chef-manage/embedded/service/chef-manage/config.ru
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/opt/chef-manage/sv/web/log] action create
        - create new directory /opt/chef-manage/sv/web/log
        - restore selinux security context
      * directory[/opt/chef-manage/sv/web/log/main] action create
        - create new directory /opt/chef-manage/sv/web/log/main
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/var/log/web] action create
        - create new directory /var/log/web
        - change mode from '' to '0755'
        - restore selinux security context
      * template[/opt/chef-manage/sv/web/log/config] action create
        - create new file /opt/chef-manage/sv/web/log/config
        - update content in file /opt/chef-manage/sv/web/log/config from none to e3b0c4
        (no diff)
        - change mode from '' to '0644'
        - restore selinux security context
      * link[/var/log/web/config] action create
        - create symlink at /var/log/web/config to /opt/chef-manage/sv/web/log/config
      * template[/opt/chef-manage/sv/web/log/run] action create
        - create new file /opt/chef-manage/sv/web/log/run
        - update content in file /opt/chef-manage/sv/web/log/run from none to 2cc622
        --- /opt/chef-manage/sv/web/log/run	2024-02-25 11:02:31.924939634 +0530
        +++ /opt/chef-manage/sv/web/log/.chef-run20240225-21931-h404fi	2024-02-25 11:02:31.924939634 +0530
        @@ -1 +1,3 @@
        +#!/bin/sh
        +exec /opt/chef-manage/embedded/bin/svlogd -tt /var/log/chef-manage/web
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/opt/chef-manage/sv/web/env] action create
        - create new directory /opt/chef-manage/sv/web/env
        - change mode from '' to '0755'
        - restore selinux security context
      * ruby_block[Delete unmanaged env files for web service] action run (skipped due to only_if)
      * template[/opt/chef-manage/sv/web/check] action create (skipped due to only_if)
      * template[/opt/chef-manage/sv/web/finish] action create (skipped due to only_if)
      * directory[/opt/chef-manage/sv/web/control] action create
        - create new directory /opt/chef-manage/sv/web/control
        - change mode from '' to '0755'
        - restore selinux security context
      * link[/opt/chef-manage/init/web] action create
        - create symlink at /opt/chef-manage/init/web to /opt/chef-manage/embedded/bin/sv
      * file[/opt/chef-manage/sv/web/down] action nothing (skipped due to action :nothing)
      * ruby_block[restart_service] action run
        * ruby_block[restart_service] action nothing (skipped due to action :nothing)
        * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/sv/web] action create (up to date)
        * template[/opt/chef-manage/sv/web/run] action create (up to date)
        * directory[/opt/chef-manage/sv/web/log] action create (up to date)
        * directory[/opt/chef-manage/sv/web/log/main] action create (up to date)
        * directory[/var/log/web] action create (up to date)
        * template[/opt/chef-manage/sv/web/log/config] action create (up to date)
        * link[/var/log/web/config] action create (up to date)
        * template[/opt/chef-manage/sv/web/log/run] action create (up to date)
        * directory[/opt/chef-manage/sv/web/env] action create (up to date)
        * ruby_block[Delete unmanaged env files for web service] action run (skipped due to only_if)
        * template[/opt/chef-manage/sv/web/check] action create (skipped due to only_if)
        * template[/opt/chef-manage/sv/web/finish] action create (skipped due to only_if)
        * directory[/opt/chef-manage/sv/web/control] action create (up to date)
        * link[/opt/chef-manage/init/web] action create (up to date)
        * file[/opt/chef-manage/sv/web/down] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/service] action create (up to date)
        * link[/opt/chef-manage/service/web] action create
          - create symlink at /opt/chef-manage/service/web to /opt/chef-manage/sv/web
        * ruby_block[wait for web service socket] action run
          - execute the ruby block wait for web service socket
        - execute the ruby block restart_service
      * ruby_block[restart_log_service] action run
        * ruby_block[restart_service] action nothing (skipped due to action :nothing)
        * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/sv/web] action create (up to date)
        * template[/opt/chef-manage/sv/web/run] action create (up to date)
        * directory[/opt/chef-manage/sv/web/log] action create (up to date)
        * directory[/opt/chef-manage/sv/web/log/main] action create (up to date)
        * directory[/var/log/web] action create (up to date)
        * template[/opt/chef-manage/sv/web/log/config] action create (up to date)
        * link[/var/log/web/config] action create (up to date)
        * template[/opt/chef-manage/sv/web/log/run] action create (up to date)
        * directory[/opt/chef-manage/sv/web/env] action create (up to date)
        * ruby_block[Delete unmanaged env files for web service] action run (skipped due to only_if)
        * template[/opt/chef-manage/sv/web/check] action create (skipped due to only_if)
        * template[/opt/chef-manage/sv/web/finish] action create (skipped due to only_if)
        * directory[/opt/chef-manage/sv/web/control] action create (up to date)
        * link[/opt/chef-manage/init/web] action create (up to date)
        * file[/opt/chef-manage/sv/web/down] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/service] action create (up to date)
        * link[/opt/chef-manage/service/web] action create (up to date)
        * ruby_block[wait for web service socket] action run
          - execute the ruby block wait for web service socket
        - execute the ruby block restart_log_service
      * directory[/opt/chef-manage/service] action create (up to date)
      * link[/opt/chef-manage/service/web] action create (up to date)
      * ruby_block[wait for web service socket] action run
        - execute the ruby block wait for web service socket
    
    * runit_service[web] action reload_log
      - reload log service
  
Recipe: omnibus-chef-manage::web
  * ruby_block[update marketplace signup sentinel atime] action run (skipped due to only_if)
Recipe: omnibus-chef-manage::worker
  * component_runit_service[worker] action enable
    * template[/var/log/chef-manage/worker/config] action create
      - create new file /var/log/chef-manage/worker/config
      - update content in file /var/log/chef-manage/worker/config from none to 5e16ac
      --- /var/log/chef-manage/worker/config	2024-02-25 11:02:36.732939616 +0530
      +++ /var/log/chef-manage/worker/.chef-config20240225-21931-6m41mc	2024-02-25 11:02:36.731939616 +0530
      @@ -1 +1,4 @@
      +# svlogd configuration
      +s104857600
      +n10
      - change mode from '' to '0644'
      - change owner from '' to 'root'
      - change group from '' to 'root'
      - restore selinux security context
  Recipe: <Dynamically Defined Resource>
    * service[worker] action nothing (skipped due to action :nothing)
    * runit_service[worker] action enable
      * ruby_block[restart_service] action nothing (skipped due to action :nothing)
      * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
      * directory[/opt/chef-manage/sv/worker] action create
        - create new directory /opt/chef-manage/sv/worker
        - change mode from '' to '0755'
        - restore selinux security context
      * template[/opt/chef-manage/sv/worker/run] action create
        - create new file /opt/chef-manage/sv/worker/run
        - update content in file /opt/chef-manage/sv/worker/run from none to 18d4c3
        --- /opt/chef-manage/sv/worker/run	2024-02-25 11:02:36.796939616 +0530
        +++ /opt/chef-manage/sv/worker/.chef-run20240225-21931-527f8c	2024-02-25 11:02:36.793939616 +0530
        @@ -1 +1,17 @@
        +#!/bin/sh
        +export DIR=/opt/chef-manage/embedded/service/chef-manage
        +export SVWAIT=30
        +export PATH=/opt/chef-manage/embedded/bin:$PATH
        +export HOME=$DIR
        +
        +cd $DIR
        +exec 2>&1
        +exec veil-env-helper --pack -s manage.secret_token \
        +                            -s manage.secret_key_base \
        +                            -s chef-server.webui_key \
        +  -- /opt/chef-manage/embedded/bin/chpst \
        +  -P \
        +  -U opscode \
        +  -u opscode \
        +     bundle exec sidekiq -e production
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/opt/chef-manage/sv/worker/log] action create
        - create new directory /opt/chef-manage/sv/worker/log
        - restore selinux security context
      * directory[/opt/chef-manage/sv/worker/log/main] action create
        - create new directory /opt/chef-manage/sv/worker/log/main
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/var/log/worker] action create
        - create new directory /var/log/worker
        - change mode from '' to '0755'
        - restore selinux security context
      * template[/opt/chef-manage/sv/worker/log/config] action create
        - create new file /opt/chef-manage/sv/worker/log/config
        - update content in file /opt/chef-manage/sv/worker/log/config from none to e3b0c4
        (no diff)
        - change mode from '' to '0644'
        - restore selinux security context
      * link[/var/log/worker/config] action create
        - create symlink at /var/log/worker/config to /opt/chef-manage/sv/worker/log/config
      * template[/opt/chef-manage/sv/worker/log/run] action create
        - create new file /opt/chef-manage/sv/worker/log/run
        - update content in file /opt/chef-manage/sv/worker/log/run from none to 9bb439
        --- /opt/chef-manage/sv/worker/log/run	2024-02-25 11:02:36.928939615 +0530
        +++ /opt/chef-manage/sv/worker/log/.chef-run20240225-21931-ldpwtm	2024-02-25 11:02:36.928939615 +0530
        @@ -1 +1,3 @@
        +#!/bin/sh
        +exec /opt/chef-manage/embedded/bin/svlogd -tt /var/log/chef-manage/worker
        - change mode from '' to '0755'
        - restore selinux security context
      * directory[/opt/chef-manage/sv/worker/env] action create
        - create new directory /opt/chef-manage/sv/worker/env
        - change mode from '' to '0755'
        - restore selinux security context
      * ruby_block[Delete unmanaged env files for worker service] action run (skipped due to only_if)
      * template[/opt/chef-manage/sv/worker/check] action create (skipped due to only_if)
      * template[/opt/chef-manage/sv/worker/finish] action create (skipped due to only_if)
      * directory[/opt/chef-manage/sv/worker/control] action create
        - create new directory /opt/chef-manage/sv/worker/control
        - change mode from '' to '0755'
        - restore selinux security context
      * link[/opt/chef-manage/init/worker] action create
        - create symlink at /opt/chef-manage/init/worker to /opt/chef-manage/embedded/bin/sv
      * file[/opt/chef-manage/sv/worker/down] action nothing (skipped due to action :nothing)
      * ruby_block[restart_service] action run
        * ruby_block[restart_service] action nothing (skipped due to action :nothing)
        * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/sv/worker] action create (up to date)
        * template[/opt/chef-manage/sv/worker/run] action create (up to date)
        * directory[/opt/chef-manage/sv/worker/log] action create (up to date)
        * directory[/opt/chef-manage/sv/worker/log/main] action create (up to date)
        * directory[/var/log/worker] action create (up to date)
        * template[/opt/chef-manage/sv/worker/log/config] action create (up to date)
        * link[/var/log/worker/config] action create (up to date)
        * template[/opt/chef-manage/sv/worker/log/run] action create (up to date)
        * directory[/opt/chef-manage/sv/worker/env] action create (up to date)
        * ruby_block[Delete unmanaged env files for worker service] action run (skipped due to only_if)
        * template[/opt/chef-manage/sv/worker/check] action create (skipped due to only_if)
        * template[/opt/chef-manage/sv/worker/finish] action create (skipped due to only_if)
        * directory[/opt/chef-manage/sv/worker/control] action create (up to date)
        * link[/opt/chef-manage/init/worker] action create (up to date)
        * file[/opt/chef-manage/sv/worker/down] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/service] action create (up to date)
        * link[/opt/chef-manage/service/worker] action create
          - create symlink at /opt/chef-manage/service/worker to /opt/chef-manage/sv/worker
        * ruby_block[wait for worker service socket] action run
          - execute the ruby block wait for worker service socket
        - execute the ruby block restart_service
      * ruby_block[restart_log_service] action run
        * ruby_block[restart_service] action nothing (skipped due to action :nothing)
        * ruby_block[restart_log_service] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/sv/worker] action create (up to date)
        * template[/opt/chef-manage/sv/worker/run] action create (up to date)
        * directory[/opt/chef-manage/sv/worker/log] action create (up to date)
        * directory[/opt/chef-manage/sv/worker/log/main] action create (up to date)
        * directory[/var/log/worker] action create (up to date)
        * template[/opt/chef-manage/sv/worker/log/config] action create (up to date)
        * link[/var/log/worker/config] action create (up to date)
        * template[/opt/chef-manage/sv/worker/log/run] action create (up to date)
        * directory[/opt/chef-manage/sv/worker/env] action create (up to date)
        * ruby_block[Delete unmanaged env files for worker service] action run (skipped due to only_if)
        * template[/opt/chef-manage/sv/worker/check] action create (skipped due to only_if)
        * template[/opt/chef-manage/sv/worker/finish] action create (skipped due to only_if)
        * directory[/opt/chef-manage/sv/worker/control] action create (up to date)
        * link[/opt/chef-manage/init/worker] action create (up to date)
        * file[/opt/chef-manage/sv/worker/down] action nothing (skipped due to action :nothing)
        * directory[/opt/chef-manage/service] action create (up to date)
        * link[/opt/chef-manage/service/worker] action create (up to date)
        * ruby_block[wait for worker service socket] action run
          - execute the ruby block wait for worker service socket
        - execute the ruby block restart_log_service
      * directory[/opt/chef-manage/service] action create (up to date)
      * link[/opt/chef-manage/service/worker] action create (up to date)
      * ruby_block[wait for worker service socket] action run
        - execute the ruby block wait for worker service socket
    
    * runit_service[worker] action reload_log
      - reload log service
  
Recipe: omnibus-chef-manage::events_disable
  * service[events] action nothing (skipped due to action :nothing)
  * runit_service[events] action disable
    * ruby_block[disable events] action run (skipped due to only_if)
     (up to date)
Recipe: omnibus-chef-manage::nginx
  * service[nginx] action nothing (skipped due to action :nothing)
  * template[/var/opt/opscode/nginx/etc/addon.d/30-chef-manage_upstreams.conf] action create
    - create new file /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_upstreams.conf
    - update content in file /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_upstreams.conf from none to 8b8e0d
    --- /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_upstreams.conf	2024-02-25 11:02:42.668939593 +0530
    +++ /var/opt/opscode/nginx/etc/addon.d/.chef-30-chef-manage_upstreams20240225-21931-fih565.conf	2024-02-25 11:02:42.668939593 +0530
    @@ -1 +1,8 @@
    +# Chef Management Console Nginx config upstreams
    +#
    +# Generated by chef-manage-ctl reconfigure
    +
    +upstream chef_manage_webapp {
    +  server 127.0.0.1:9462;
    +}
    - change mode from '' to '0644'
    - change owner from '' to 'root'
    - change group from '' to 'root'
    - restore selinux security context
  * file[/var/opt/opscode/nginx/etc/addon.d/30-opscode-manage_upstreams.conf] action delete (up to date)
  * template[/var/opt/opscode/nginx/etc/addon.d/30-chef-manage_internal.conf] action create
    - create new file /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_internal.conf
    - update content in file /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_internal.conf from none to ec5842
    --- /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_internal.conf	2024-02-25 11:02:42.728939593 +0530
    +++ /var/opt/opscode/nginx/etc/addon.d/.chef-30-chef-manage_internal20240225-21931-lpkzst.conf	2024-02-25 11:02:42.728939593 +0530
    @@ -1 +1,4 @@
    +# Chef Management Console Nginx config for internal LB
    +#
    +# Generated by chef-manage-ctl reconfigure
    - change mode from '' to '0644'
    - change owner from '' to 'root'
    - change group from '' to 'root'
    - restore selinux security context
  * file[/var/opt/opscode/nginx/etc/addon.d/30-opscode-manage_internal.conf] action delete (up to date)
  * template[/var/opt/opscode/nginx/etc/addon.d/30-chef-manage_external.conf] action create
    - create new file /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_external.conf
    - update content in file /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_external.conf from none to fae77f
    --- /var/opt/opscode/nginx/etc/addon.d/30-chef-manage_external.conf	2024-02-25 11:02:42.771939593 +0530
    +++ /var/opt/opscode/nginx/etc/addon.d/.chef-30-chef-manage_external20240225-21931-f3x1j6.conf	2024-02-25 11:02:42.771939593 +0530
    @@ -1 +1,19 @@
    +# Chef Management Console Nginx config for External LB.
    +#
    +# Generated by chef-manage-ctl reconfigure
    +
    +add_header Referrer-Policy 'strict-origin';
    +add_header Permissions-Policy "camera=(), payment=(), microphone=(), gyroscope=(), magnetometer=(), midi=(), geolocation=()";
    +
    +# Asset configuration
    +location ~ ^/assets/ {
    +  root /opt/chef-manage/embedded/service/chef-manage/public;
    +  expires 1y;
    +  add_header Cache-Control public;
    +
    +  add_header ETag "";
    +  break;
    +}
    +
    +set $add_on_override_upstream "chef_manage_webapp";
    - change mode from '' to '0644'
    - change owner from '' to 'root'
    - change group from '' to 'root'
    - restore selinux security context
  * file[/var/opt/opscode/nginx/etc/addon.d/30-opscode-manage_external.conf] action delete (up to date)
  * template[/var/opt/opscode/nginx/etc/nginx.d/manage.conf] action delete (up to date)
Recipe: omnibus-chef-manage::default
  * link[/usr/bin/chef-manage-ctl] action create (up to date)
  * link[/usr/bin/opscode-manage-ctl] action create (up to date)
  * file[/var/opt/chef-manage/etc/chef-manage-running.json] action create
    - create new file /var/opt/chef-manage/etc/chef-manage-running.json
    - update content in file /var/opt/chef-manage/etc/chef-manage-running.json from none to ee905f
    --- /var/opt/chef-manage/etc/chef-manage-running.json	2024-02-25 11:02:42.848939592 +0530
    +++ /var/opt/chef-manage/etc/.chef-chef-manage-running20240225-21931-z219ot.json	2024-02-25 11:02:42.848939592 +0530
    @@ -1 +1,152 @@
    +{
    +  "chef-manage": {
    +    "sysvinit_id": "CM",
    +    "chef_base_path": "/opt/opscode",
    +    "install_path": "/opt/chef-manage",
    +    "var_path": "/var/opt/chef-manage",
    +    "config_path": "/var/opt/chef-manage/etc",
    +    "log_path": "/var/log/chef-manage",
    +    "tmp_path": "/var/opt/chef-manage/tmp",
    +    "web": {
    +      "log_directory": "/var/log/chef-manage/web",
    +      "log_rotation": {
    +        "file_maxbytes": 104857600,
    +        "num_to_keep": 10
    +      }
    +    },
    +    "worker": {
    +      "log_directory": "/var/log/chef-manage/worker",
    +      "log_rotation": {
    +        "file_maxbytes": 104857600,
    +        "num_to_keep": 10
    +      }
    +    },
    +    "redis": {
    +      "log_directory": "/var/log/chef-manage/redis",
    +      "log_rotation": {
    +        "file_maxbytes": 104857600,
    +        "num_to_keep": 10
    +      },
    +      "host": "localhost",
    +      "port": 11002,
    +      "url": "redis://localhost:11002/0"
    +    },
    +    "services": {
    +      "web": {
    +        "enable": true
    +      },
    +      "worker": {
    +        "enable": true
    +      },
    +      "events": {
    +
    +      }
    +    },
    +    "webapp": {
    +      "worker_processes": 4,
    +      "port": 9462,
    +      "listen": "127.0.0.1:9462",
    +      "backlog": 1024,
    +      "tcp_nodelay": true,
    +      "worker_timeout": 3600,
    +      "min_request": 3072,
    +      "max_request": 4096,
    +      "min_memory": 120,
    +      "max_memory": 150
    +    },
    +    "ssl_verify_mode": "verify_none",
    +    "trusted_certs_dir": "",
    +    "ssl_client_cert": "",
    +    "ssl_client_key": "",
    +    "ssl_ca_file": "",
    +    "user": {
    +      "username": "opscode",
    +      "shell": "/bin/sh",
    +      "home": "/opt/opscode/embedded"
    +    },
    +    "fqdn": "rhel-chef-server",
    +    "chef_server_external_url": "https://rhel-chef-server",
    +    "chef_server_internal_url": "https://localhost",
    +    "origin": "rhel-chef-server",
    +    "public_port": 443,
    +    "ldap": {
    +      "enabled": false,
    +      "adjective": null
    +    },
    +    "external": {
    +      "port": 443
    +    },
    +    "platform": {
    +      "public_url": "https://rhel-chef-server",
    +      "url": "https://localhost",
    +      "user": "pivotal"
    +    },
    +    "backbone_paginator_timeout": 120000,
    +    "chef_documentation_url": "https://docs.chef.io",
    +    "disable_sign_up": false,
    +    "email_from_address": "Chef Notifications <notifications@chef.io>",
    +    "nginx_addon_prefix": 30,
    +    "org_creation_enabled": true,
    +    "runit_timeout": 30,
    +    "session_timeout": 1440,
    +    "session_timeout_absolute": 10080,
    +    "max_login_failures": 7,
    +    "support_email_address": "support@chef.io",
    +    "support_site_url": "https://chef.io/support",
    +    "support_tickets_url": "https://getchef.zendesk.com/hc/en-us/requests/new",
    +    "chef_title": "Chef Infra",
    +    "disable_upgrade_banner": false,
    +    "air_gapped": false,
    +    "events": {
    +
    +    },
    +    "google_analytics": {
    +
    +    },
    +    "logging": {
    +      "chef_log_level": "info",
    +      "log_level": "info"
    +    },
    +    "marketo": {
    +
    +    },
    +    "eloqua": {
    +
    +    },
    +    "saml": {
    +      "enabled": false,
    +      "issuer_url": "http://delivery/api/v0",
    +      "verify_tls": true,
    +      "adjective": "SAML"
    +    },
    +    "recaptcha": {
    +      "enabled": false,
    +      "fail_open": true,
    +      "verify_url": "https://www.google.com/recaptcha/api/siteverify"
    +    },
    +    "sentry": {
    +
    +    },
    +    "secrets": {
    +      "provider": "chef-secrets-env",
    +      "var_name": "CHEF_SECRETS_DATA"
    +    },
    +    "marketplace": {
    +      "sign_up": {
    +        "enabled": false,
    +        "timeout": 3600
    +      },
    +      "sentinel": {
    +        "file": "/var/opt/chef-manage/marketplace_sentinel"
    +      }
    +    },
    +    "onetrust": {
    +      "enabled": false
    +    }
    +  },
    +  "run_list": [
    +  "recipe[omnibus-chef-manage::default]"
    +]
    +
    +}
    - change mode from '' to '0600'
    - change owner from '' to 'opscode'
    - change group from '' to 'root'
    - restore selinux security context
Recipe: omnibus-chef-manage::redis
  * component_runit_service[redis] action restart
  Recipe: <Dynamically Defined Resource>
    * service[redis] action nothing (skipped due to action :nothing)
    * runit_service[redis] action restart (up to date)
     (up to date)
Recipe: omnibus-chef-manage::web
  * component_runit_service[web] action restart
  Recipe: <Dynamically Defined Resource>
    * service[web] action nothing (skipped due to action :nothing)
    * runit_service[web] action restart (up to date)
     (up to date)
Recipe: omnibus-chef-manage::nginx
  * service[nginx] action restart
    - restart service service[nginx]

Running handlers:
Running handlers complete
Infra Phase complete, 96/273 resources updated in 29 seconds
[2024-02-25T11:02:44+05:30] WARN: This release of Chef Infra Client became end of life (EOL) on May 1st 2023. Please update to a supported release to receive new features, bug fixes, and security updates.
chef-manage Reconfigured!
</pre>
