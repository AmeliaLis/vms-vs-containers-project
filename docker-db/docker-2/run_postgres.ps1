# Pull the latest MySQL image
docker pull mysql:latest

# Record start time
$start_time = Get-Date -UFormat %s.%N

# Run PostgreSQL container
docker run --name postgres_container -e POSTGRES_PASSWORD=docker -p 5432:5432 -d postgres

# Copy SQL files to the running container
docker cp "C:\Users\DELL\Desktop\licencjat\bachelor\docker-db\docker-2\postgres-sakila-db" postgres_container:/sql_files

# Record end time
$end_time = Get-Date -UFormat %s.%N

# Calculate time difference
$time_diff = [double]($end_time - $start_time)

Write-Host "Time taken to start Docker PostgreSQL container: $time_diff seconds"
