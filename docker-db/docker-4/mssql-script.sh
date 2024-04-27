#!/bin/bash

tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-4/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time for INSERTING SCHEMA is %R seconds.'

{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -i '/tmp/sql-server-sakila-db/sql-server-sakila-schema.sql'"
}

TIMEFORMAT='Elapsed time for INSERTING DATA is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -i '/tmp/sql-server-sakila-db/sql-server-sakila-insert-data.sql'"
}
TIMEFORMAT='Elapsed time for DELETING DATA is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -i '/tmp/sql-server-sakila-db/sql-server-sakila-delete-data.sql'"
}

TIMEFORMAT='Elapsed time for DELETING OBJECTS IN SCHEMA is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -i '/tmp/sql-server-sakila-db/sql-server-sakila-drop-objects.sql'"
}