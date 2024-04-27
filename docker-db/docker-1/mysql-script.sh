#!/bin/bash
#Specifying the format for the output of the 'time' command

tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-1/temp_file.txt"

docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 -e 'CREATE DATABASE sakila;'"

exec 1>>"$tmpfile" 2>&1

TIMEFORMAT='Elapsed time for INSERTING SCHEMA is %R seconds.'
{
    time docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-schema.sql"
}

TIMEFORMAT='Elapsed time for INSERTING DATA is %R seconds.'
{
    time docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-insert-data.sql"
}

TIMEFORMAT='Elapsed time for DELETING DATA is %R seconds.'
{
    time docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-delete-data.sql"
}

TIMEFORMAT='Elapsed time for DELETING OBJECTS IN SCHEMA is %R seconds.'
{
    time docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-drop-objects.sql"
}

TIMEFORMAT='Elapsed time for DROPING DATABASE is %R seconds.'
time docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 -e 'DROP DATABASE sakila;'"