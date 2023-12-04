#!/bin/bash

echo "Start Redis server"
systemctl enable redis-server
service redis-server start
service redis-server status

echo "Start MySQL server"
systemctl enable mysql
chown mysql.mysql /var/mysql
mkdir -p /var/mysql/mysqld >& /dev/null
mkdir -p /var/mysql/home >& /dev/null
usermod -d /var/mysql/home mysql
service mysql start
service mysql status

echo "Create .env file"
default_bhima_port=8080
default_bhima_db_name=bhima
default_bhima_db_host=127.0.0.1
export BHIMA_PORT="${BHIMA_PORT:-$default_bhima_port}"
export BHIMA_DB_NAME="${BHIMA_DB_NAME:-$default_bhima_db_name}"
export BHIMA_DB_HOST="${BHIMA_DB_HOST:-$default_bhima_db_host}"
export BHIMA_DB_PASSWORD="${BHIMA_DB_PASSWORD:-$DEFAULT_BHIMA_DB_PASSWORD}"
echo "BHIMA DB Password: $BHIMA_DB_PASSWORD"
cp .env.sample .env
sed -i "s/DB_PASS='password'/DB_PASS=$BHIMA_DB_PASSWORD/" .env
sed -i "s/DB_HOST='localhost'/DB_HOST=$BHIMA_DB_HOST/" .env
sed -i "s/DB_NAME='bhima_test'/DB_NAME=$BHIMA_DB_NAME/" .env

mkdir bin
cp .env bin/

echo "Update Bhima"
git pull

# Install the node dependenicies
echo "Install node dependencies"
yarn --ignore-engines

echo "Build Bhima runtime"
# npm run build

yarn build

yarn build:db

# echo "Building initial mysql database..."
# 
# echo "[ build ] database schema"
# mysql "$BHIMA_DB_NAME" < $HOME/apps/bhima/bin/server/models/schema.sql || { echo "failed to build DB scheme" ; exit 1; }
# echo "[ build ] functions"
# mysql "$BHIMA_DB_NAME" < $HOME/apps/bhima/bin/server/models/functions.sql || { echo "failed to import functions into DB" ; exit 1; }
# 
# echo "[ build ] procedures"
# mysql "$BHIMA_DB_NAME" < $HOME/apps/bhima/bin/server/models/procedures.sql || { echo "failed to import procedures into DB 1/2" ; exit 1; }
# 
# mysql "$BHIMA_DB_NAME" < $HOME/apps/bhima/bin/server/models/admin.sql || { echo "failed to import procedures into DB 2/2" ; exit 1; }
# 
# echo "[ build ] triggers"
# mysql "$BHIMA_DB_NAME" < $HOME/apps/bhima/bin/server/models/triggers.sql
# 
# echo "[ build ] default data"
# mysql  "$BHIMA_DB_NAME" < $HOME/apps/bhima/bin/server/models/icd10.sql || { echo "failed to import default data into DB 1/2" ; exit 1; }
# mysql  "$BHIMA_DB_NAME" < $HOME/apps/bhima/bin/server/models/bhima.sql || { echo "failed to import default data into DB 2/2" ; exit 1; }
# 
# echo "[build] recomputing mappings"
# mysql "$BHIMA_DB_NAME" -e "Call zRecomputeEntityMap();" || { echo "failed to recompute mappings 1/2" ; exit 1; }
# mysql "$BHIMA_DB_NAME" -e "Call zRecomputeDocumentMap();" || { echo "failed to recompute mappings 2/2" ; exit 1; }
# 
# echo "[ /build ]"
