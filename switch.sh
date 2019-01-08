#!/usr/bin/env bash

existA=`docker exec node-hello-proxy ls /etc/nginx/conf.d/ | grep proxy-a.conf`
if [[ ! -z ${existA} ]]; then
    green="b"
    blue="a"
else
    green="a"
    blue="b"
fi

docker exec node-hello-proxy mv /etc/nginx/conf.d/proxy-${blue}.conf /etc/nginx/conf.d/proxy-${blue}
docker exec node-hello-proxy mv /etc/nginx/conf.d/proxy-${green} /etc/nginx/conf.d/proxy-${green}.conf
docker exec node-hello-proxy nginx -s reload