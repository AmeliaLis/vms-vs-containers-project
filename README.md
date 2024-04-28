# Bachelor workspace


## Configuring VM's network and IP

1. Set up VM with Ubuntu Server 20.04.6 iso image
2. Set up 4 GB RAM, 2 CPU and 25 GB of memory for every VM.
3. In settings configure network to use bridged network.
4. Apply changes in netplan configuration

5. `vim /etc/netplan/00-installer-config.yaml`

### VM1 - MYSQL HOST
```
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.0.115/24
      gateway4: 192.168.0.1
```

### VM2 - POSTGRES HOST
```
network:
  version: 2
  ethernets:
    enp0s3:     
      dhcp4: no
      addresses:
        - 192.168.0.116/24
      gateway4: 192.168.0.1
```
sudo apt update
sudo apt install python3-psycopg2

### VM4 - SQLLITE/MICROSOFT SQL SERVER
```
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.0.118/24
      gateway4: 192.168.0.1
```

## VM5 - Ansible HOST
```
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.0.119/24
      gateway4: 192.168.0.1
```

6. `netplan apply`
7. `sudo apt-get update`
8. `apt-get install git`



### Configuring ansible host

1. generate ssh key on ansible host
2. copy public key with winscp tool
3. add key to github profile
4. configure windows host to start vms:
    - https://www.ansible.com/blog/connecting-to-a-windows-host
    - https://www.youtube.com/watch?v=-vPXS8UuJoI
    - https://www.ansiblepilot.com/articles/configure-a-windows-host-for-ansible-ansible-winrm/
    - https://docs.ansible.com/ansible/latest/os_guide/windows_setup.html
    - https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui
    - https://forums.virtualbox.org/viewtopic.php?t=104814

5. vim /etc/ansible/ansible.cfg `[defaults] callbacks_enabled=profile_tasks` -> it enables to check the timinings

### Sample Playbook:
```
- name: Run echo command on VM
  hosts: dbserver
  become: true
  become_method: sudo
  vars:
      ansible_user: amelia_user
      ansible_password: admin123
  tasks:
      - name: Execute echo command
      command: echo 'Hello, world'
```

Hosts:
```
[dbserver]
192.168.0.118
```
### How to Run playbook:

`ansible-playbook playbook.yml -i inventory.ini --extra-vars "ansible_sudo_pass=yourPassword"`
`ansible-playbook -i /home/amelia_user/hosts.ini ./vm-4/db-vm4.yaml -kK` - it will ask for sudo password


# VIRTUAL BOX COMMANDS

VBoxManage metrics query db-machine-2 /CPU/Load/User,CPU/Load/Kernel

# VM COMMANDS

show processlist
df -h

# MYSQL

- https://dev.mysql.com/doc/mysql-installation-excerpt/8.3/en/docker-mysql-getting-started.html


# POSTGRESSQL 

- https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

amelia_user@db-machine:~$ sudo -i -u postgres
amelia_user@db-machine:~$ sudo -u amelia_user psql
psql (12.18 (Ubuntu 12.18-0ubuntu0.20.04.1))
\l    - display list of databases
\dt schema_name.*


# SQL SERVER

- https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-run-transact-sql-script-files?view=sql-server-ver16
- https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16&tabs=ubuntu2004
- https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-deploy-ansible?view=sql-server-ver16 
- https://www.youtube.com/watch?v=1Qlf_xwFz7Y 
- https://galaxy.ansible.com/ui/repo/published/microsoft/sql/docs/
- https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&tabs=cli&pivots=cs1-bash

sql server has been installed on 192.168.0.118 connect via
sqlcmd -S 127.0.0.1 -U sa -P Admin123! -C 
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U amelia_user -P Admin123! -C 
USE master; -- Make sure you are in the master database context
GO

-- Query to get the list of databases
SELECT name, database_id, create_date, state_desc FROM sys.databases;

USE YourDatabaseName; -- Replace YourDatabaseName with the name of the database you want to check
GO

-- Query to get the list of tables in the specified database
SELECT schema_name(schema_id) AS schema_name,name AS table_name,create_date,modify_date FROM sys.tables;


## Next steps

- refactor sh scripts for vms?


1. Configure mysql on VM1 - DONE - RERUN on ansible / write script for win host (without latency)
2. Configure postgress on VM2 - DONE - RERUN on ansible / write script for win host (without latency)
4. Configure Microsoft SQL Server - DONE - RERUN on ansible / write script for win host (without latency) - REVIEW
5. Docker mysql - DONE 
6. Docker postgres - DONE 
8. Docker MSSQL - DONE 

[defaults]
inventory = ./hosts
callbacks_enabled = timer, profile_tasks, profile_roles

add it ^


SELECT * FROM  CUSTOMER ORDER BY first_name, last_name;

add select 

       |
fix it v
select f.title, count(r.rental_date)
	from film as f
	join inventory as i on i.film_id = f.film_id
	join rental as r on r.inventory_id = i.inventory_id
	group by f.title
	order by count(r.rental_date) desc;\\


  "Memory": 4294967296,
		"NanoCpus": 2000000000,