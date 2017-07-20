#!/usr/bin/env bash

docker stop some-mysql some-wordpress
docker run --rm --name some-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql
docker run --rm --name some-wordpress --link some-mysql:mysql -p 8080:80 -d wordpress