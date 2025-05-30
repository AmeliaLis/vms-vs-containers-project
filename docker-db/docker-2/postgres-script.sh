#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

# Redirecting the output of time commands to a temporary file
tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-2/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-schema.sql'"
}

time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-insert-data.sql'"
time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-delete-data.sql'"
time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-drop-objects.sql'"