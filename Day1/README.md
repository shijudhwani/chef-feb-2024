# Day 1

## Lab - Writing your first Chef cookbook 

### Chef Workstation Machine
```
sudo -i
cd /root
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

## Adding the cookbook to running of Chef nodes from Chef Workstation machine
```
knife node run_list add rhel-chef-node "recipe[first-cookbook]"
knife node run_list add windows-chef-node "recipe[first-cookbook]"
```

Expected output
<pre>
[root@rhel-chef-workstation ~]# knife node run_list add rhel-chef-node "recipe[first-cookbook]"
rhel-chef-node:
  run_list: recipe[first-cookbook]  

[root@rhel-chef-workstation ~]# knife node run_list add windows-chef-node "recipe[first-cookbook]"
windows-chef-node:
  run_list: recipe[first-cookbook]
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

### Troubleshooting Clock drift between Chef Server and Chef Nodes
Edit the below file in Chef server /etc/opscode/chef-server.rb
```
opscode_erchef['auth_skew'] = 43200
```

To apply config changes run the below command on Chef Server
```
chef-server-ctl reconfigure
```

Expected output
<pre>
[root@rhel-chef-server ~]# chef-server-ctl reconfigure

Documentation: https://docs.chef.io/server/
Patents:       https://www.chef.io/patents

Starting Chef Infra Client, version 16.13.16
Patents: https://www.chef.io/patents
resolving cookbooks for run list: ["private-chef::default"]
Synchronizing Cookbooks:
  - runit (5.1.6)
  - packagecloud (1.0.1)
  - private-chef (0.1.2)
  - enterprise (1.1.0)
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
  * linux_user[opscode] action create
    - alter user opscode
    - change shell from /bin/sh to /usr/sbin/nologin
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
  * template[/var/opt/opscode/opscode-erchef/sys.config] action create
    - update content in file /var/opt/opscode/opscode-erchef/sys.config from 24aae9 to 8daf51
    --- /var/opt/opscode/opscode-erchef/sys.config	2024-02-25 00:11:35.131872416 +0530
    +++ /var/opt/opscode/opscode-erchef/.chef-sys20240225-30688-11mnkhj.config	2024-02-25 17:54:35.241845322 +0530
    @@ -80,7 +80,7 @@
             {ip, "127.0.0.1"},
             {port, 8000},
             {reqid_header_name, "X-Request-Id"},
    -        {auth_skew, 900},
    +        {auth_skew, 43200},
             %% currently only used by the search endpoint to bound
             %% how many nodes are deserialized at a time in
             %% preparing a response.
    - restore selinux security context
  * execute[remove_erchef_siz_files] action run
    - execute rm -f *.siz
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
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-blocks-t.gif] action create (up to date)
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
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-body.gif] action create (up to date)
    * cookbook_file[/var/opt/opscode/nginx/html/images/bg-blocks-b.gif] action create (up to date)
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
    - update content in file /var/opt/opscode/nginx/stats_htpasswd from 32af83 to 1bdf38
    - suppressed sensitive resource
    - restore selinux security context
  * template[/var/opt/opscode/nginx/etc/chef_https_lb.conf] action create (up to date)
  * template[/var/opt/opscode/nginx/etc/chef_http_lb.conf] action create (up to date)
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
    - update content in file /etc/opscode/chef-server-running.json from 90bf3a to 3a010d
    --- /etc/opscode/chef-server-running.json	2024-02-25 11:00:36.201940076 +0530
    +++ /etc/opscode/.chef-chef-server-running20240225-30688-dqjjvu.json	2024-02-25 17:54:37.119845315 +0530
    @@ -133,7 +133,7 @@
           "vip": "127.0.0.1",
           "listen": "127.0.0.1",
           "port": 8000,
    -      "auth_skew": "900",
    +      "auth_skew": 43200,
           "authz_pooler_timeout": "0",
           "bulk_fetch_batch_size": "5",
           "udp_socket_pool_size": null,
    - restore selinux security context
  * ruby_block[print reconfigure warnings] action run
    - execute the ruby block print reconfigure warnings
Recipe: private-chef::opscode-erchef
  * component_runit_service[opscode-erchef] action restart
  Recipe: <Dynamically Defined Resource>
    * service[opscode-erchef] action nothing (skipped due to action :nothing)
    * runit_service[opscode-erchef] action restart (up to date)
     (up to date)
Recipe: private-chef::nginx
  * component_runit_service[nginx] action restart
  Recipe: <Dynamically Defined Resource>
    * service[nginx] action nothing (skipped due to action :nothing)
    * runit_service[nginx] action restart (up to date)
     (up to date)

Running handlers:
Running handlers complete
Chef Infra Client finished, 45/498 resources updated in 18 seconds
Chef Server Reconfigured!  
</pre>
