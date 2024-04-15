FROM mysql:latest

# Copy the custom entrypoint script into the container
COPY custom_entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/custom_entrypoint.sh

# Set the custom entrypoint script as the entrypoint
ENTRYPOINT ["/usr/local/bin/custom_entrypoint.sh"]