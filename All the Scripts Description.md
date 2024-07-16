# 1. Backup Script

## Explanation
- SOURCE: The directory to be backed up.
- DESTINATION: The directory where the backup will be stored.
- DATE: Captures the current date and time to create a unique backup folder.
- mkdir -p $DESTINATION/$DATE: Creates the backup directory if it does not exist.
- cp -r $SOURCE $DESTINATION/$DATE: Copies the contents of the source directory  to the backup directory.
- echo "Backup completed on $DATE": Outputs a message indicating the completion of the backup.

# 2. Disk Usage Check Script

## Explanation
- THRESHOLD: Sets the disk usage percentage threshold.
- df -H: Lists disk usage in human-readable format.
- grep -vE '^Filesystem|tmpfs|cdrom': Filters out unnecessary lines.
- awk '{ print $5 " " $1 }': Extracts the usage percentage and partition name.
- while read output: Iterates over each line of the filtered output.
- usage=$(echo $output | awk '{ print $1}' | cut -d'%' -f1): Extracts the usage percentage.
- partition=$(echo $output | awk '{ print $2 }'): Extracts the partition name.
- if [ $usage -ge $THRESHOLD ]; then: Checks if the usage exceeds the threshold.
- echo "Warning: Disk usage on 𝑝𝑎𝑟𝑡𝑖𝑡𝑖𝑜𝑛𝑖𝑠𝑎𝑡{usage}%": Prints a warning message.

# 3. Service Health Check Script

## Explanation
- SERVICE: The name of the service to check.
- systemctl is-active --quiet $SERVICE: Checks if the service is running.
- echo "$SERVICE is running": Prints a message if the service is running.
- systemctl start $SERVICE: Starts the service if it is not running.

## 4. Listening Ports Script

Installation
Install net-tools:
sudo apt install net-tools


## Explanation
- netstat -tuln: Lists all TCP and UDP listening ports.
- grep LISTEN: Filters the output to show only listening ports.

## 5. Automatic Package Updates Script

## Explanation
- apt-get update: Updates the package list.
- apt-get upgrade -y: Upgrades all installed packages.
- apt-get autoremove -y: Removes unnecessary packages.
- apt-get clean: Cleans up the package cache.
- echo "System packages updated and cleaned up": Outputs a message indicating the completion of the update and cleanup.

## 6. Database Backup Script
Installation
Install MySQL:
sudo apt install mysql-server
Set up MySQL password:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY
'root';
FLUSH PRIVILEGES;

## Explanation
- DB_NAME: The name of the database to back up.
- BACKUP_DIR: The directory where the backup will be stored.
- DATE: Captures the current date and time.
- mysqldump -u root -p $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql:
  Dumps the database to a SQL file.
- echo "Database backup completed: $BACKUP_DIR/$DB_NAME-$DATE.sql":
  Outputs a message indicating the completion of the backup.
