#!/usr/bin/bash

name="image"
tag="0.1"
image_name="${name}:${tag}"
container_name="ampl_container"

docker build -t $image_name .
#docker ps -q --filter "name=${container_name}" | grep -q . && echo Found || echo Not Found
docker ps -q --filter "name=${container_name}" | grep -q . && docker stop $container_name && docker rm -fv $container_name
#docker run --name ampl_container -v $(pwd):/mnt -t $image_name
