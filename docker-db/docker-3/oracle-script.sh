#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

# Redirecting the output of time commands to a temporary file
tmpfile="/home/amelia/Desktop/bachelor/docker-db/docker-3/temp_file.txt"

{
    time docker exec oracle-container-test sh -c "sqlplus SYS/oracle as SYSDBA @/tmp/oracle-sakila-db/oracle-sakila-schema.sql"

} 2>&1 | tee -a "$tmpfile"

# Redirecting all subsequent commands' output to the same file
exec 1>>"$tmpfile" 2>&1

time docker exec oracle-container-test sh -c "sqlplus SYS/oracle as SYSDBA @/tmp/oracle-sakila-db/oracle-sakila-insert-data.sql"
time docker exec oracle-container-test sh -c "sqlplus SYS/oracle as SYSDBA @/tmp/oracle-sakila-db/oracle-sakila-delete-data.sql"
time docker exec oracle-container-test sh -c "sqlplus SYS/oracle as SYSDBA @/tmp/oracle-sakila-db/oracle-sakila-drop-objects.sql"
