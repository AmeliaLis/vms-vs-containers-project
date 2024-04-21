#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

tmpfile="/home/amelia/Desktop/bachelor/docker-db/docker-2/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

{
    time docker pull postgres:latest
}

{
    time docker run -d --name postgres-container-test -e POSTGRES_USER=sakila -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=sakila -v /home/amelia/Desktop/bachelor/docker-db/docker-2/postgres-sakila-db:/tmp/postgres-sakila-db postgres:latest
}

sleep 20
{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-schema.sql'"
}

time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-insert-data.sql'"
time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-delete-data.sql'"
time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-drop-objects.sql'"