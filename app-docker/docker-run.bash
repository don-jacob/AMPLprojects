#!/usr/bin/bash

name="app-ampl_image"
tag="0.1"
image_name="${name}:${tag}"
container_name="app-ampl_container"

externalPort=8080

ampl_binary_download_link="https://ampl.com/demo/ampl.linux64.tgz"
ampl_binary="ampl.linux64.tgz"

if [ ! -f $ampl_binary ]; then
	curl --output $ampl_binary $ampl_binary_download_link
fi


if [ -z $1 ]; then

	echo "usage: ${0} [OPTION]"
	echo "[OPTION] can take values build or run"
	echo "example: ${0} build"
	echo "example: ${0} run"

else

	docker container ls --all --filter name=$container_name -q | grep . && docker container stop $container_name && docker container rm --force --volumes $container_name || echo "container, ${container_name} not found, nothing to remove"
	
	if [ $1 == "build" ]; then
		docker images $image_name -aq | grep . && docker rmi $image_name --force || echo "docker, ${image_name} not found"
		docker build -t $image_name .
	fi
	
	if [ $1 == "run" ]; then
		docker run --privileged=true --name $container_name -v /$(pwd):/mnt -p $externalPort:8080 -dit $image_name 
		docker exec -dt $container_name jupyter notebook --no-browser --ip=0.0.0.0 --port=8080 --allow-root --NotebookApp.token='' --NotebookApp.password=''
	fi
fi
