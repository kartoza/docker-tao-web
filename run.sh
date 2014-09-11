#!/bin/sh
docker kill tao-web
docker rm tao-web
docker kill tao-postgis
docker rm tao-postgis
MYSQLPWD=`pwgen 20 1`
docker run --name="tao-mysql" --hostname="tao-mysql" --restart="always" -e MYSQL_ROOT_PASSWORD=${MYSQLPWD} -d -t mysql
docker run --name="tao-web" --hostname="tao-web" --restart="always" -d -t -p 8002:80 --link tao-mysql:tao-mysql kartoza/tao-web
echo "Your tao is running - use mysql host 'tao-mysql' and password '${MYSQLPWD}' when setting up the connections in tao."

