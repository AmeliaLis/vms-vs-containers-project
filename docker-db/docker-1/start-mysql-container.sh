#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-1/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

{
    time docker pull mysql:latest
}

{
    time docker run -d --name mysql-container-test -e MYSQL_ROOT_PASSWORD=admin123 -v /home/amelia/Desktop/bachelor/docker-db/docker-1/mysql-sakila-db:/tmp/mysql-sakila-db mysql-container:test
}
