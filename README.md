# Chef Feb 2024

## Installing Chef Server in RHEL v8.9
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

#### Installing Chef Server
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

#### Open Chef Server ports
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

## Installing Chef Workstation in RHEL v8.9

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


#### Download the self-signed certificate from Chef Server to Chef Workstation ( Do this in Chef Workstation Machine )
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

#### Troubleshooting ssl fetch errors
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
