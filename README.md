# Docker Recipe for TaoTesting

This is a (docker)[https://www.docker.com/] build recipe for Tao Testing (See http://taotesting.com/) - an
online testing and certification platform.

Assuming you already have docker installed, the simplest way to use it is to do:

```
docker pull kartoza/docker-tao-web
docker pull kartoza/potgis
```

To get the base images. This may take a little while depending on your available bandwidth. Now spin up
a mysql container and a Tao container:

```
docker run --name="tao-postgis" \
	--hostname="tao-postgis" \
	--restart="always" \
	-d -t kartoza/postgis

docker run --name="tao-web" \
	--hostname="tao-web" \
	--restart="always" \
	-d -t -p 8002:80 \
	--link tao-postgis:tao-postgis \
	kartoza/tao-web
```

Next determine the ip address of your postgis container and create the tao
database:

```
createdb -h 172.17.0.29 -U docker tao
```

Once your tao container is running open your browser at http://localhost:8002
and follow the installation wizard.

For the postgresql connection options use host 'tao-postgis', user 'docker' and
password 'docker' or set your own user/pwd  and then check the 'over write
database' option.


-----------------

Tim Sutton (tim@kartoza.com)
September 2014
