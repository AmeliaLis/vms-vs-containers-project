#!/bin/bash
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

# Redirecting the output of time commands to a temporary file
tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-2/temp_file_2.txt"

{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-schema.sql'"
} 2>&1 | tee -a "$tmpfile"

# Redirecting all subsequent commands' output to the same file
exec 1>>"$tmpfile" 2>&1

# Uncomment the following lines if you want to include the output of other commands as well
time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-insert-data.sql'"
time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-delete-data.sql'"
time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-drop-objects.sql'"

# Printing only the timing information at the end
cat "$tmpfile"
