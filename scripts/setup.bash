#!/bin/bash

# Start redis
systemctl enable redis-server
service redis-server start
service redis-server status

# Start MySQL
systemctl enable mysql
chown mysql.mysql /var/mysql
mkdir -p /var/mysql/mysqld >& /dev/null
mkdir -p /var/mysql/home >& /dev/null
usermod -d /var/mysql/home mysql
service mysql start
service mysql status

# Create the bhima user in MySQL
mysql -u root < ./scripts/mysql_init.sql

