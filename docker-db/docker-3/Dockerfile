# Use the official Ubuntu 20.04 image as base
FROM ubuntu:20.04

# Update package lists and install sqlite3
RUN apt-get update && \
    apt-get install -y sqlite3 && \
    apt-get clean

# Set the working directory inside the container
WORKDIR /data

# Create a SQLite database in the /data directory
RUN sqlite3 test.db

# Set entry point to sqlite3 and connect to the created database
ENTRYPOINT ["sqlite3", "/data/test.db"]
