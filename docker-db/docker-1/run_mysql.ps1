# Pull the latest MySQL image
docker pull mysql:latest

# Record start time
$start_time = Get-Date -UFormat %s.%N

# Run MySQL container
docker run -d --name mysql_container -e MYSQL_ROOT_PASSWORD=your_password -v mysql_data:/var/lib/mysql mysql:latest

# Record end time
$end_time = Get-Date -UFormat %s.%N

# Calculate time difference
$time_diff = [double]($end_time - $start_time)

Write-Host "Time taken to start Docker mysql container: $time_diff seconds"

# Copy SQL files to the running container
docker cp "C:\Users\DELL\Desktop\licencjat\bachelor\docker-db\docker-1\mysql-sakila-db" mysql_container:/sql_files
