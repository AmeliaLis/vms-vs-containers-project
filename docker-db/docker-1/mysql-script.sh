#!/bin/bash
#Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

#Measuring elapsed time for the enclosed commands
time {
    docker pull mysql:latest
}

time {
    docker run -d --name mysql-container-test -e MYSQL_ROOT_PASSWORD=admin123 -v /c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-1/mysql-sakila-db:/tmp/mysql-sakila-db mysql:latest
}

sleep 20

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 -e 'CREATE DATABASE sakila;'"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysq-sakila-db/mysql-sakila-schema.sql"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysq-sakila-db/mysql-insert-data.sql"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysq-sakila-db/mysql-delete-data.sql"
}

time {
    docker exec mysql-container-test sh -c "mysql -u root -padmin123 -h 127.0.0.1 -P3306 sakila < /tmp/mysq-sakila-db/mysql-drop-objects.sql"
}