# Sample Dockerfile for postgres on ubuntu

# Use the Ubuntu 20.04 base image
FROM ubuntu:20.04

# Install PostgreSQL
RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib

# Adjust PostgreSQL configuration to allow remote connections
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/*/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/*/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Set up entrypoint to start PostgreSQL when the container starts
ENTRYPOINT ["/usr/lib/postgresql/*/bin/postgres", "-D", "/var/lib/postgresql/*/main", "-c", "config_file=/etc/postgresql/*/main/postgresql.conf"]
