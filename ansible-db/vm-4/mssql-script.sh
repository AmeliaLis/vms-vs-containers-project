#!/bin/sh
# Specifying the format for the output of the 'time' command
TIMEFORMAT='Elapsed time is %R seconds.'

tmpfile="/c/Users/DELL/Desktop/licencjat/bachelor/ansible-db/vm-4/temp_file.txt"

exec 1>>"$tmpfile" 2>&1

time VBoxManage startvm db-machine-4 --type headless

time sqlcmd -S 192.168.0.118 -U amelia_user -P Admin123! -C -i C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-4\sql-server-sakila-db\sql-server-sakila-schema.sql
    
time sqlcmd -S 192.168.0.118 -U amelia_user -P Admin123! -C -d sakila -i C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-4\sql-server-sakila-db\sql-server-sakila-insert-data.sql

time sqlcmd -S 192.168.0.118 -U amelia_user -P Admin123! -C -d sakila -i C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-4\sql-server-sakila-db\sql-server-sakila-delete-data.sql

time sqlcmd -S 192.168.0.118 -U amelia_user -P Admin123! -C -d sakila -i C:\Users\DELL\Desktop\licencjat\bachelor\ansible-db\vm-4\sql-server-sakila-db\sql-server-sakila-drop-objects.sql

time sqlcmd -S 192.168.0.118 -U amelia_user -P Admin123! -C -Q "DROP DATABASE sakila;"