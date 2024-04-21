#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

tmpfile="/home/amelia/Desktop/bachelor/docker-db/docker-3/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

{
    time docker run -d --name oracle-container-test -v /home/amelia/Desktop/bachelor/docker-db/docker-3/oracle-sakila-db:/tmp/oracle-sakila-db container-registry.oracle.com/database/free:latest
}