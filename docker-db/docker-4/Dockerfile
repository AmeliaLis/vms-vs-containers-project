# Use the official Ubuntu 20.04 image as the base
FROM ubuntu:20.04

# Set noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget gnupg2 software-properties-common && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)" && \
    apt-get update && \
    apt-get install -y mssql-server && \
    wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev

# Set environment variables
ENV ACCEPT_EULA=Y \
    SA_PASSWORD=Admin123!

# Expose the port for SQL Server
EXPOSE 1433

# Add SQL Server tools to the PATH
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc


CMD ["/opt/mssql/bin/sqlservr"]