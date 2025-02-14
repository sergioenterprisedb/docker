#!/bin/bash
IMAGE_NAME="pge:17.2"
CONTAINER_IDS=$(docker ps -a -q --filter "ancestor=$IMAGE_NAME")
echo "Container: $CONTAINER_IDS"
docker stop $CONTAINER_IDS
docker rm $CONTAINER_IDS
docker rmi pge:17.2 -f