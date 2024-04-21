#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

tmpfile="/home/amelia/Desktop/bachelor/docker-db/docker-4/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

time docker pull mcr.microsoft.com/mssql/server:2022-latest

time docker run -v /home/amelia/Desktop/bachelor/docker-db/docker-4/sql-server-sakila-db:/tmp/sql-server-sakila-db -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Admin123!" -p 1433:1433 --name mssql-container-test --hostname mssql-container-test -d mcr.microsoft.com/mssql/server:2022-latest

