#!/bin/bash
tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-2/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

TIMEFORMAT='Elapsed time for STARTING CONTAINER is %R seconds.'
{
    time docker run --cpus="2" --memory=4096m -d --name postgres-container-test -e POSTGRES_USER=sakila -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=sakila -v C:\\Users\\DELL\\Desktop\\licencjat\\bachelor\\docker-db\\docker-2\\postgres-sakila-db:/tmp/postgres-sakila-db postgres:12.18
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

TIMEFORMAT='Elapsed time for SELECTING DATA FROM CUSTOMER TABLE SORTED BY NAME AND LAST NAME is %R seconds.'
{
    time docker exec postgres-container-test sh -c 'PGPASSWORD=admin123 psql -U sakila -d sakila -c "SELECT * FROM customer ORDER BY first_name, last_name;"'
}

TIMEFORMAT='Elapsed time for SELECTING THE MOST FREQUENTLY RENTED MOVIES IN DESCENDING ORDER is %R seconds.'
{
    time docker exec postgres-container-test sh -c 'PGPASSWORD=admin123 psql -U sakila -d sakila -c "select f.title, count(r.rental_date) from film as f join inventory as i on i.film_id = f.film_id join rental as r on r.inventory_id = i.inventory_id group by f.title order by count(r.rental_date) desc;"'
}

TIMEFORMAT='Elapsed time for DELETING DATA is %R seconds.'
{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-delete-data.sql'"
}

TIMEFORMAT='Elapsed time for DROPING OBJECTS IN SCHEMA is %R seconds.'
{
    time docker exec postgres-container-test sh -c "PGPASSWORD=admin123 psql -U sakila -c '\i /tmp/postgres-sakila-db/postgres-sakila-drop-objects.sql'"
}