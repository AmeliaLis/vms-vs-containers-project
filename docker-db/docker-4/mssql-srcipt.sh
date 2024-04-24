#!/bin/bash

docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Admin123! -Q \"USE master; CREATE LOGIN amelia_user WITH PASSWORD = 'Admin123!'; ALTER SERVER ROLE sysadmin ADD MEMBER amelia_user;\""


# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

# Redirecting the output of time commands to a temporary file
tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-4/temp_file.txt"

{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U amelia_user -PAdmin123! -C -i /tmp/sql-server-sakila-db/sql-server-sakila-schema.sql"

} 2>&1 | tee -a "$tmpfile"

# Redirecting all subsequent commands' output to the same file
exec 1>>"$tmpfile" 2>&1

time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U amelia_user -PAdmin123! -C -d sakila -i /tmp/sql-server-sakila-db/sql-server-sakila-insert-data.sql"
time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U amelia_user -PAdmin123! -C -d sakila -i /tmp/sql-server-sakila-db/sql-server-sakila-delete-data.sql"
time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U amelia_user -PAdmin123! -C -d sakila -i /tmp/sql-server-sakila-db/sql-server-sakila-drop-objects.sql"
