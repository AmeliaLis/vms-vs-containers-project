#!/bin/bash

tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-1/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

TIMEFORMAT='Elapsed time for BUILDING MYSQL IMAGE is %R seconds.'
time docker build -t mysql-container:test . --no-cache

TIMEFORMAT='Elapsed time for STARTING CONTAINER is %R seconds.'
time docker run -d --cpus="2" --memory=4096m --name mysql-container-test -p 3306:3306 -e MYSQL_ROOT_PASSWORD=admin123 -v C:\\Users\\DELL\\Desktop\\licencjat\\bachelor\\docker-db\\docker-1\\mysql-sakila-db:/tmp/mysql-sakila-db mysql-container:test
