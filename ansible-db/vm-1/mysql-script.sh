#!/bin/sh
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

tmpfile="/home/amelia/Desktop/bachelor/ansible-db/vm-1/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

time VBoxManage startvm db-machine-4 --type headless

time ssh amelia_user@192.168.0.115 mysql -u amelia_user -pamelia_user -h localhost -e 'create database sakila;'

time ssh amelia_user@192.168.0.115 mysql -u amelia_user -pamelia_user -h localhost sakila -e 'source /home/amelia_user/mysql-sakila-db/mysql-sakila-schema.sql'
    
time ssh amelia_user@192.168.0.115 mysql -u amelia_user -pamelia_user -h localhost sakila -e 'source /home/amelia_user/mysql-sakila-db/mysql-sakila-insert-data.sql'

time ssh amelia_user@192.168.0.115 mysql -u amelia_user -pamelia_user -h localhost sakila -e 'source /home/amelia_user/mysql-sakila-db/mysql-sakila-delete-data.sql'

time ssh amelia_user@192.168.0.115 mysql -u amelia_user -pamelia_user -h localhost sakila -e 'source /home/amelia_user/mysql-sakila-db/mysql-sakila-drop-objects.sql'

time ssh amelia_user@192.168.0.115 mysql -u amelia_user -pamelia_user -h localhost sakila -e 'drop database sakila;'