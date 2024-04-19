#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

# Redirecting the output of time commands to a temporary file
tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/ansible-db/vm-3/temp_file.txt"

{
    time echo "@C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-3\oracle-sakila-db\oracle-sakila-schema.sql" | sql system/oracle@localhost:1521/free

} 2>&1 | tee -a "$tmpfile"

# Redirecting all subsequent commands' output to the same file
exec 1>>"$tmpfile" 2>&1

# Uncomment the following lines if you want to include the output of other commands as well
time echo "@C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-3\oracle-sakila-db\oracle-sakila-insert-data.sql" | sql system/oracle@localhost:1521/free
time echo "@C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-3\oracle-sakila-db\oracle-sakila-delete-data.sql" | sql system/oracle@localhost:1521/free
time echo "@C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-3\oracle-sakila-db\oracle-sakila-drop-objects.sql" | sql system/oracle@localhost:1521/free
