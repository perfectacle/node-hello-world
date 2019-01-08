#!/usr/bin/env bash

docker-compose build

docker-compose stop app-a
docker-compose up -d app-a

status=""
while [[ -z ${status} ]]; do
    echo "health check"
    status=`curl -I localhost:9000 | grep 200`
    sleep 1
done

docker-compose stop app-b
docker-compose up -d app-b