# Sample Dockerfile for Microsoft SQL Server on ubuntu

# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Set environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=YourStrongPassword

# Install dependencies and Microsoft SQL Server
RUN apt-get update && \
    apt-get install -y curl gnupg2 && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list | tee /etc/apt/sources.list.d/mssql-server.list && \
    apt-get update && \
    apt-get install -y mssql-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose the default SQL Server port
EXPOSE 1433

# Start SQL Server and enable SQL Server Agent
CMD /opt/mssql/bin/sqlservr && /opt/mssql/bin/mssql-conf set sqlagent.enabled true
