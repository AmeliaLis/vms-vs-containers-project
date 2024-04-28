#!/bin/bash

tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/docker-db/docker-4/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time for INSERTING SCHEMA is %R seconds.'

{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -i '/tmp/sql-server-sakila-db/sql-server-sakila-schema.sql'"
}

TIMEFORMAT='Elapsed time for INSERTING DATA is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -i '/tmp/sql-server-sakila-db/sql-server-sakila-insert-data.sql'"
}

TIMEFORMAT='Elapsed time for SELECTING DATA FROM CUSTOMER TABLE SORTED BY NAME AND LAST NAME is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -Q 'SELECT * FROM CUSTOMER ORDER BY first_name, last_name;'"
}

TIMEFORMAT='Elapsed time for SELECTING THE MOST FREQUENTLY RENTED MOVIES IN DESCENDING ORDER is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -Q 'select f.title, count(r.rental_date) from film as f join inventory as i on i.film_id = f.film_id join rental as r on r.inventory_id = i.inventory_id group by f.title order by count(r.rental_date) desc;'"
}

TIMEFORMAT='Elapsed time for DELETING DATA is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -i '/tmp/sql-server-sakila-db/sql-server-sakila-delete-data.sql'"
}

TIMEFORMAT='Elapsed time for DELETING OBJECTS IN SCHEMA is %R seconds.'
{
    time docker exec mssql-container-test sh -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Admin123! -C -d sakila -i '/tmp/sql-server-sakila-db/sql-server-sakila-drop-objects.sql'"
}