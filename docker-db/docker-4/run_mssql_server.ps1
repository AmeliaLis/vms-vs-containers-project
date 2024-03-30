
docker pull mcr.microsoft.com/mssql/server:2022-latest

# Record start time
$start_time = Get-Date -UFormat %s.%N

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=<YourStrong@Passw0rd>" -p 1433:1433 --name mssql_server_container --hostname mssql_server_container -d mcr.microsoft.com/mssql/server:2022-latest

# Record end time
$end_time = Get-Date -UFormat %s.%N

# Calculate time difference
$time_diff = [double]($end_time - $start_time)

Write-Host "Time taken to start Docker mssql server container: $time_diff seconds"

# Copy SQL files to the running container
docker cp "C:\Users\DELL\Desktop\licencjat\bachelor\docker-db\docker-4\mysql-sakila-db" mysql_container:/sql_files

docker exec -it mssql_server_container /opt/mssql-tools/bin/sqlcmd `-S localhost -U SA -P "<YourStrong@Passw0rd>" `-Q "ALTER LOGIN SA WITH PASSWORD='<YourNewStrong@Passw0rd>'"