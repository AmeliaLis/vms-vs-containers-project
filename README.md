# Bachelor workspace


## Configuring VM's network and IP

1. Set up VM with Ubuntu Server 20.04.6 iso image
2. Set up 4 GB RAM, 1 CPU and 25 GB of memory for every VM.
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

### VM3 - ORACLE DB HOST
```
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.0.117/24
      gateway4: 192.168.0.1
```

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
5. mysql has been configured by ansible playbook - medium
6. postgress has been configured not tested yet - https://medium.com/splunkuserdeveloperadministrator/creating-postgresql-database-with-ansible-da65878b782f 

Sample Playbook:
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
Run playbook:

`ansible-playbook playbook.yml -i inventory.ini --extra-vars "ansible_sudo_pass=yourPassword"`

## Next steps
- install necessary tools on ansible controller :
    sudo yum install ansible-collection-microsoft-sql
    ansible-galaxy collection install microsoft.sql​
- First steps to DOCKER!


1. Configure mysql on VM1 - DONE
2. Configure postgress on VM2 - preparation, not tested
3. Configure oracle db on VM3 - https://docs.oracle.com/en/database/oracle/oracle-database/21/xeinl/installing-oracle-database-free.html#GUID-46EA860A-AAC4-453F-8EEE-42CC55A4FAD5 -> do it manually
4. Configure Microsoft SQL Server -> https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16&tabs=ubuntu2004 , https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-deploy-ansible?view=sql-server-ver16 , https://www.youtube.com/watch?v=1Qlf_xwFz7Y , https://galaxy.ansible.com/ui/repo/published/microsoft/sql/docs/ - preparation, not tested
5. Think about SQLLITE or DB2 when Oracle is impossible to download - https://www.ibm.com/docs/en/db2/11.5?topic=servers-db2-installation-methods 