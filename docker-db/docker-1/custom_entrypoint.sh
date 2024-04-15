#!/bin/bash

# Add custom configuration to my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf

# Execute the CMD from Dockerfile
exec "$@"
