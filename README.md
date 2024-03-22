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
    enp0s3:    # Replace eth0 with your network interface name
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
    enp0s3:    # Replace eth0 with your network interface name
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
    enp0s3:    # Replace eth0 with your network interface name
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
    enp0s3:    # Replace eth0 with your network interface name
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
    enp0s3:    # Replace eth0 with your network interface name
      dhcp4: no
      addresses:
        - 192.168.0.119/24
      gateway4: 192.168.0.1
```

6. `netplan apply`
7. `sudo apt-get update`
8. `apt-get install git`


## Next steps

0. Try to set up VM5 and install ansible to manage all of the hosts

Playbook:
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
      command: echo 'Hello, worldl
```

Hosts:
```
[dbserver]
192.168.0.118
```

`ansible-playbook playbook.yml -i inventory.ini --extra-vars "ansible_sudo_pass=yourPassword"`


NEXT:
- figure out github repo and file management
- create playbook to Start all of the VMs by Name?
- edit playbook to start database
- edit playbook to execute sql from file downloaded from github

1. Configure mysql on VM1
2. Configure postgress on VM2
3. Configure oracle db on VM3
4. Configure Microsoft SQL Server -> https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16&tabs=ubuntu2004