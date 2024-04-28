#!/bin/bash

TIMEFORMAT='Elapsed time for STARTING CONTAINER is %R seconds.'

tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-4/temp_file.txt"

exec 1>>"$tmpfile" 2>&1


time docker run --cpus="2" --memory=4096m -v C:\\Users\\DELL\\Desktop\\licencjat\\bachelor\\docker-db\\docker-4\\sql-server-sakila-db:/tmp/sql-server-sakila-db --name mssql-container-test -d mssql-container:test

sleep 10