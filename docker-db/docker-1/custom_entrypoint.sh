#!/bin/bash

# Add custom configuration to my.cnf
echo "bind-address = 0.0.0.0" >> /etc/my.cnf

# Execute the CMD from Dockerfile
exec "$@"
