#!/bin/bash
#Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 -e 'CREATE DATABASE sakila;'"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-schema.sql"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-insert-data.sql"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-delete-data.sql"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysql-sakila-db/mysql-sakila-drop-objects.sql"
}