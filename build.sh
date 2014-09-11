#!/bin/sh

docker pull mysql
docker build -t kartoza/tao-web .
