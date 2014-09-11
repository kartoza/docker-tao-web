# Docker Recipe for TaoTesting

This is a (docker)[https://www.docker.com/] build recipe for Tao Testing (See http://taotesting.com/) - an
online testing and certification platform.

Assuming you already have docker installed, the simplest way to use it is to do:

```
docker pull kartoza/docker-tao-web
docker pull mysql
```

To get the base images. This may take a little while depending on your available bandwidth. Now spin up
a mysql container and a Tao container:

```
docker run --name="tao-mysql" --hostname="tao-mysql" --restart="always" -e MYSQL_ROOT_PASSWORD=somepassword -d -t mysql
docker run --name="tao-web" --hostname="tao-web" --restart="always" -d -t -p 8002:80 --link tao-mysql:tao-mysql kartoza/tao-web
```

Once your tao container is running open your browser at http://localhost:8002 and follow the installation wizard.
For the mysql connections options use host 'tao-mysql' and whatever password you defined above.


-----------------

Tim Sutton (tim@kartoza.com)
September 2014
