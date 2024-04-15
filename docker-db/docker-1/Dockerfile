FROM mysql:latest

# Copy the custom entrypoint script into the container
COPY custom_entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom_entrypoint.sh
RUN /usr/local/bin/custom_entrypoint.sh
RUN systemctl restart mysql