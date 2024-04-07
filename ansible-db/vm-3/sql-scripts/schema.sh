#!/bin/bash

# Start the SQL session and execute the script
echo "@C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-3\oracle-sakila-db\oracle-sakila-schema.sql" | sql system/oracle@localhost:1521/free
