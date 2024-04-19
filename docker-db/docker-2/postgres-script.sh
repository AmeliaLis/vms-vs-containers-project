#!/bin/bash
#Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

time {
    psql -U amelia_user -c '\i /home/amelia_user/postgres-sakila-db/postgres-sakila-schema.sql'
    docker exec postgres-container-test sh -c "psql -U sakila -Padmin123 -c '\i /home/amelia_user/postgres-sakila-db/postgres-sakila-schema.sql'"
}

time {
    docker exec postgres-container-test sh -c "psql -U sakila -Padmin123 -c '\i /home/amelia_user/postgres-sakila-db/postgres-sakila-insert-data.sql'"
}

time {
    docker exec postgres-container-test sh -c "psql -U sakila -Padmin123 -c '\i /home/amelia_user/postgres-sakila-db/postgres-sakila-delete-data.sql'"
}

time {
    docker exec postgres-container-test sh -c "psql -U sakila -Padmin123 -c '\i /home/amelia_user/postgres-sakila-db/postgres-sakila-drop-objects.sql'"
}