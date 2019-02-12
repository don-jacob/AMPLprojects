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

sudo docker container ls --all --filter name=$container_name -q | grep . && sudo docker container stop $container_name && sudo docker container rm --force --volumes $container_name || echo "container, ${container_name} not found, nothing to remove"
	
	if [ $1 == "build" ]; then
		sudo docker images $image_name -aq | grep . && sudo docker rmi $image_name --force || echo "docker, ${image_name} not found"
		sudo docker build -t $image_name .
	fi
	
	if [ $1 == "run" ]; then
		sudo docker run --rm --privileged=true --name $container_name --rm -v /$(pwd):/mnt -p $externalPort:8080 -dit $image_name 
		sudo docker exec -dt $container_name jupyter notebook --no-browser --ip=0.0.0.0 --port=8080 --allow-root --NotebookApp.token='' --NotebookApp.password=''
	fi
fi
