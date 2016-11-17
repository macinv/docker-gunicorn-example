#!/usr/bin/env bash

set -e

docker build -t $IMAGE_NAME .
echo Docker images:
docker images
docker run -d --name $CONTAINER_NAME $IMAGE_NAME
echo Running docker containers:
docker ps -a

RUNNING=$(docker inspect -f {{.State.Running}} $CONTAINER_NAME)

if [ $RUNNING == true ]; then
    exit 0
else
    echo "$1" 1>&2
    exit 1
fi
