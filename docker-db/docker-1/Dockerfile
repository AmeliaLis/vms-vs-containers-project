FROM mysql:latest

# Copy the custom entrypoint script into the container
COPY custom_entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom_entrypoint.sh
RUN /usr/local/bin/custom_entrypoint.sh
RUN apt-get update && \
    apt-get install -y mysql-server mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*