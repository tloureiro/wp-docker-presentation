#!/usr/bin/env bash

for i in {0..9}
do
	HOST_PORT=$((9090+$i))
	echo "Creating wordpress instance. Port:$HOST_PORT"
	docker run --name some-mysql-$HOST_PORT -e MYSQL_ROOT_PASSWORD=password -d mysql
	docker run --name some-wordpress-$HOST_PORT --link some-mysql-$HOST_PORT:mysql -p $HOST_PORT:80 -d wordpress
	sleep 2
	echo "Done!";
done

read -p "Press any key to stop everything"

for i in {0..9}
do
	HOST_PORT=$((9090+$i))
	echo "Destroying instance. Port:$HOST_PORT"
	docker stop some-wordpress-$HOST_PORT some-mysql-$HOST_PORT
	docker rm some-wordpress-$HOST_PORT some-mysql-$HOST_PORT
	echo "Done!";
done
