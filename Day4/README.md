# Day 4

# Installing Docker Community Edition in RHEL 8.x
```
sudo subscription-manager register
sudo subscription-manager refresh
sudo subscription-manager attach --auto

sudo yum config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

sudo yum -y install docker-ce --allowerasing

sudo systemctl enable --now docker

systemctl is-active docker

curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose

sudo mv docker-compose /usr/local/bin && sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose 
```

Expected output
<pre>
[root@rhel-chef-workstation tmp]# yum config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
Updating Subscription Management repositories.
Adding repo from: https://download.docker.com/linux/centos/docker-ce.repo
[root@rhel-chef-workstation tmp]# yum -y install docker-ce --allowerasing
Updating Subscription Management repositories.
Docker CE Stable - x86_64                                                                       52 kB/s |  57 kB     00:01    
Dependencies resolved.
===============================================================================================================================
 Package                      Arch      Version                                      Repository                           Size
===============================================================================================================================
Installing:
 docker-ce                    x86_64    3:25.0.3-1.el8                               docker-ce-stable                     26 M
Installing dependencies:
 containerd.io                x86_64    1.6.28-3.1.el8                               docker-ce-stable                     35 M
     replacing  runc.x86_64 1:1.1.9-1.module+el8.9.0+19648+0d5ae0ec
 crun                         x86_64    1.8.7-1.module+el8.9.0+21243+a586538b        rhel-8-for-x86_64-appstream-rpms    239 k
 docker-ce-cli                x86_64    1:25.0.3-1.el8                               docker-ce-stable                    7.3 M
 libcgroup                    x86_64    0.41-19.el8                                  rhel-8-for-x86_64-baseos-rpms        70 k
Installing weak dependencies:
 criu-libs                    x86_64    3.18-4.module+el8.9.0+19090+d2921118         rhel-8-for-x86_64-appstream-rpms     39 k
 docker-buildx-plugin         x86_64    0.12.1-1.el8                                 docker-ce-stable                     13 M
 docker-ce-rootless-extras    x86_64    25.0.3-1.el8                                 docker-ce-stable                    5.0 M
 docker-compose-plugin        x86_64    2.24.6-1.el8                                 docker-ce-stable                     13 M
Removing dependent packages:
 buildah                      x86_64    1:1.31.3-1.module+el8.9.0+19761+326da906     @AppStream                           29 M
 cockpit-podman               noarch    75-1.module+el8.9.0+19761+326da906           @AppStream                          740 k
 podman                       x86_64    3:4.6.1-4.module+el8.9.0+19761+326da906      @AppStream                           50 M
 podman-catatonit             x86_64    3:4.6.1-4.module+el8.9.0+19761+326da906      @AppStream                          765 k
Downgrading:
 containers-common            x86_64    1:1.2.2-10.module+el8.4.0+11311+9da8acfb     rhel-8-for-x86_64-appstream-rpms     99 k

Transaction Summary
===============================================================================================================================
Install    9 Packages
Remove     4 Packages
Downgrade  1 Package

Total download size: 100 M
Downloading Packages:
(1/10): containers-common-1.2.2-10.module+el8.4.0+11311+9da8acfb.x86_64.rpm                     99 kB/s |  99 kB     00:00    
(2/10): docker-buildx-plugin-0.12.1-1.el8.x86_64.rpm                                           1.4 MB/s |  13 MB     00:09    
(3/10): containerd.io-1.6.28-3.1.el8.x86_64.rpm                                                3.4 MB/s |  35 MB     00:10    
(4/10): docker-ce-rootless-extras-25.0.3-1.el8.x86_64.rpm                                      3.0 MB/s | 5.0 MB     00:01    
(5/10): docker-ce-cli-25.0.3-1.el8.x86_64.rpm                                                  1.3 MB/s | 7.3 MB     00:05    
(6/10): criu-libs-3.18-4.module+el8.9.0+19090+d2921118.x86_64.rpm                               75 kB/s |  39 kB     00:00    
(7/10): crun-1.8.7-1.module+el8.9.0+21243+a586538b.x86_64.rpm                                  367 kB/s | 239 kB     00:00    
(8/10): libcgroup-0.41-19.el8.x86_64.rpm                                                       186 kB/s |  70 kB     00:00    
(9/10): docker-compose-plugin-2.24.6-1.el8.x86_64.rpm                                          2.3 MB/s |  13 MB     00:05    
(10/10): docker-ce-25.0.3-1.el8.x86_64.rpm                                                     1.2 MB/s |  26 MB     00:22    
-------------------------------------------------------------------------------------------------------------------------------
Total                                                                                          4.3 MB/s | 100 MB     00:23     
Docker CE Stable - x86_64                                                                      4.1 kB/s | 1.6 kB     00:00    
Importing GPG key 0x621E9F35:
 Userid     : "Docker Release (CE rpm) <docker@docker.com>"
 Fingerprint: 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35
 From       : https://download.docker.com/linux/centos/gpg
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                       1/1 
  Running scriptlet: docker-compose-plugin-2.24.6-1.el8.x86_64                                                             1/1 
  Installing       : docker-compose-plugin-2.24.6-1.el8.x86_64                                                            1/16 
  Running scriptlet: docker-compose-plugin-2.24.6-1.el8.x86_64                                                            1/16 
  Running scriptlet: libcgroup-0.41-19.el8.x86_64                                                                         2/16 
  Installing       : libcgroup-0.41-19.el8.x86_64                                                                         2/16 
  Running scriptlet: libcgroup-0.41-19.el8.x86_64                                                                         2/16 
  Installing       : criu-libs-3.18-4.module+el8.9.0+19090+d2921118.x86_64                                                3/16 
  Installing       : crun-1.8.7-1.module+el8.9.0+21243+a586538b.x86_64                                                    4/16 
  Installing       : docker-buildx-plugin-0.12.1-1.el8.x86_64                                                             5/16 
  Running scriptlet: docker-buildx-plugin-0.12.1-1.el8.x86_64                                                             5/16 
  Installing       : docker-ce-cli-1:25.0.3-1.el8.x86_64                                                                  6/16 
  Running scriptlet: docker-ce-cli-1:25.0.3-1.el8.x86_64                                                                  6/16 
  Installing       : containerd.io-1.6.28-3.1.el8.x86_64                                                                  7/16 
  Running scriptlet: containerd.io-1.6.28-3.1.el8.x86_64                                                                  7/16 
  Installing       : docker-ce-rootless-extras-25.0.3-1.el8.x86_64                                                        8/16 
  Running scriptlet: docker-ce-rootless-extras-25.0.3-1.el8.x86_64                                                        8/16 
  Installing       : docker-ce-3:25.0.3-1.el8.x86_64                                                                      9/16 
  Running scriptlet: docker-ce-3:25.0.3-1.el8.x86_64                                                                      9/16 
  Downgrading      : containers-common-1:1.2.2-10.module+el8.4.0+11311+9da8acfb.x86_64                                   10/16 
  Erasing          : buildah-1:1.31.3-1.module+el8.9.0+19761+326da906.x86_64                                             11/16 
  Erasing          : cockpit-podman-75-1.module+el8.9.0+19761+326da906.noarch                                            12/16 
  Running scriptlet: podman-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64                                               13/16 
  Erasing          : podman-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64                                               13/16 
  Running scriptlet: podman-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64                                               13/16 
  Cleanup          : containers-common-2:1-54.module+el8.9.0+19761+326da906.x86_64                                       14/16 
  Erasing          : podman-catatonit-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64                                     15/16 
  Running scriptlet: podman-catatonit-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64                                     15/16 
  Obsoleting       : runc-1:1.1.9-1.module+el8.9.0+19648+0d5ae0ec.x86_64                                                 16/16 
  Running scriptlet: runc-1:1.1.9-1.module+el8.9.0+19648+0d5ae0ec.x86_64                                                 16/16 
  Verifying        : containers-common-1:1.2.2-10.module+el8.4.0+11311+9da8acfb.x86_64                                    1/16 
  Verifying        : containers-common-2:1-54.module+el8.9.0+19761+326da906.x86_64                                        2/16 
  Verifying        : containerd.io-1.6.28-3.1.el8.x86_64                                                                  3/16 
  Verifying        : runc-1:1.1.9-1.module+el8.9.0+19648+0d5ae0ec.x86_64                                                  4/16 
  Verifying        : docker-buildx-plugin-0.12.1-1.el8.x86_64                                                             5/16 
  Verifying        : docker-ce-3:25.0.3-1.el8.x86_64                                                                      6/16 
  Verifying        : docker-ce-cli-1:25.0.3-1.el8.x86_64                                                                  7/16 
  Verifying        : docker-ce-rootless-extras-25.0.3-1.el8.x86_64                                                        8/16 
  Verifying        : docker-compose-plugin-2.24.6-1.el8.x86_64                                                            9/16 
  Verifying        : criu-libs-3.18-4.module+el8.9.0+19090+d2921118.x86_64                                               10/16 
  Verifying        : crun-1.8.7-1.module+el8.9.0+21243+a586538b.x86_64                                                   11/16 
  Verifying        : libcgroup-0.41-19.el8.x86_64                                                                        12/16 
  Verifying        : buildah-1:1.31.3-1.module+el8.9.0+19761+326da906.x86_64                                             13/16 
  Verifying        : cockpit-podman-75-1.module+el8.9.0+19761+326da906.noarch                                            14/16 
  Verifying        : podman-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64                                               15/16 
  Verifying        : podman-catatonit-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64                                     16/16 
Installed products updated.

Downgraded:
  containers-common-1:1.2.2-10.module+el8.4.0+11311+9da8acfb.x86_64                                                            
Installed:
  containerd.io-1.6.28-3.1.el8.x86_64                          criu-libs-3.18-4.module+el8.9.0+19090+d2921118.x86_64           
  crun-1.8.7-1.module+el8.9.0+21243+a586538b.x86_64            docker-buildx-plugin-0.12.1-1.el8.x86_64                        
  docker-ce-3:25.0.3-1.el8.x86_64                              docker-ce-cli-1:25.0.3-1.el8.x86_64                             
  docker-ce-rootless-extras-25.0.3-1.el8.x86_64                docker-compose-plugin-2.24.6-1.el8.x86_64                       
  libcgroup-0.41-19.el8.x86_64                                
Removed:
  buildah-1:1.31.3-1.module+el8.9.0+19761+326da906.x86_64    cockpit-podman-75-1.module+el8.9.0+19761+326da906.noarch          
  podman-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64      podman-catatonit-3:4.6.1-4.module+el8.9.0+19761+326da906.x86_64   

Complete!
[root@rhel-chef-workstation tmp]# sudo systemctl enable --now docker
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
[root@rhel-chef-workstation tmp]# systemctl is-active docker
active
[root@rhel-chef-workstation tmp]# curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 11.2M  100 11.2M    0     0  2165k      0  0:00:05  0:00:05 --:--:-- 4526k
[root@rhel-chef-workstation tmp]# sudo mv docker-compose /usr/local/bin && sudo chmod +x /usr/local/bin/docker-compose
[root@rhel-chef-workstation tmp]# sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose   
</pre>
