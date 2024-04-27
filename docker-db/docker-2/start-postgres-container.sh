#!/bin/bash
# Specifying the format for the output of the 'time' command
tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-2/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

TIMEFORMAT='Elapsed time for PULLING POSTGRES IMAGE is %R seconds.'
{
    time docker pull postgres:latest --no-cache
}

TIMEFORMAT='Elapsed time for STARTING CONTAINER is %R seconds.'
{
    time docker run --cpus="2" --memory=4096m -d --name postgres-container-test -e POSTGRES_USER=sakila -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=sakila -v C:\\Users\\DELL\\Desktop\\licencjat\\bachelor\\docker-db\\docker-2\\postgres-sakila-db:/tmp/postgres-sakila-db postgres:latest
}

echo "Sleeping 20 seconds" 
sleep 20

TIMEFORMAT='Elapsed time for INSERTING SCHEMA is %R seconds.'
{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-schema.sql'"
}

TIMEFORMAT='Elapsed time for INSERTING DATA is %R seconds.'
{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-insert-data.sql'"
}

TIMEFORMAT='Elapsed time for DELETING DATA is %R seconds.'
{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-delete-data.sql'"
}

TIMEFORMAT='Elapsed time for DROPING OBJECTS IN SCHEMA is %R seconds.'
{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-drop-objects.sql'"
}