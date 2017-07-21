#!/bin/bash

docker-compose exec wordpress wp --allow-root "$@"
