#!/usr/bin/bash

name="dev-ampl_image"
tag="0.1"
image_name="${name}:${tag}"
container_name="dev-ampl_container"


ampl_binary_download_link="https://ampl.com/demo/ampl.linux64.tgz"
ampl_binary="ampl.linux64.tgz"

if [ ! -f $ampl_binary ]; then
	curl --output $ampl_binary $ampl_binary_download_link
fi

docker container ls --all --filter name=$container_name -q | grep . && docker container stop $container_name && docker container rm --force --volumes $container_name || echo "container, ${container_name} not found, nothing to remove"
docker images $image_name -aq | grep . && docker rmi $image_name --force || echo "docker, ${image_name} not found"
docker build -t $image_name .
docker run --privileged=true --name $container_name -v /$(pwd):/mnt -d -it $image_name
docker exec -d -it $container_name conda install numpy
#docker run --name ampl_container -p 8888:8888 -dt $image_name
#docker -dt $image_name jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password=''
