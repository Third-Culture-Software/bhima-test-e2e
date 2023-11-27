#!/bin/bash

# Start MySQL
systemctl enable mysql
chown mysql.mysql /var/mysql
mkdir -p /var/mysql/mysqld >& /dev/null
mkdir -p /var/mysql/home >& /dev/null
usermod -d /var/mysql/home mysql
service mysql start

# Start redis
systemctl enable redis-server
service redis-server start

