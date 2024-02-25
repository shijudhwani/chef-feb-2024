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
