#!/bin/bash

# Start MySQL
# systemctl enable mysql
chown mysql.mysql /var/mysql
mkdir -p /var/mysql/mysqld >& /dev/null
# usermod -d /var/mysql mysql
service mysql start

# Start redis
systemctl enable redis-server
service redis start

service mysql status

service redis status
