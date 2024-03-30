# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set non-interactive mode during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install MySQL server and other necessary packages
RUN apt-get update && \
    apt-get install -y mysql-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose MySQL default port
EXPOSE 3306

# Configure MySQL to accept connections from all hosts
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# Enable remote login to MySQL
RUN sed -i 's/^bind-address/#bind-address/' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    echo 'bind-address = 0.0.0.0' >> /etc/mysql/mysql.conf.d/mysqld.cnf

# Start MySQL service when the container starts
CMD ["mysqld"]

# Set the default root password for MySQL
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
