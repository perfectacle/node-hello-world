#!/usr/bin/env bash

docker-compose build app

existA=`docker exec node-hello-proxy ls /etc/nginx/conf.d/ | grep proxy-a.conf`
if [[ ! -z ${existA} ]]; then
    green="b"
    blue="a"
else
    green="a"
    blue="b"
fi

docker-compose stop app-${green}
docker-compose up -d app-${green}

status=""
while [[ -z ${status} ]]; do
    echo "health check"
    status=`docker exec node-hello-${green} wget --spider -S localhost:3000 2>&1 | grep "HTTP/" | awk '{print $2}'`
    sleep 1
done

docker exec node-hello-proxy mv /etc/nginx/conf.d/proxy-${blue}.conf /etc/nginx/conf.d/proxy-${blue}
docker exec node-hello-proxy mv /etc/nginx/conf.d/proxy-${green} /etc/nginx/conf.d/proxy-${green}.conf
docker exec node-hello-proxy nginx -s reload