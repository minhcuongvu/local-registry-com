#!/bin/bash

WORKER_NAME="wslkindmultinodes-worker"

echo "Worker name set to: $WORKER_NAME"

DOCKER_CONTAINER_CURRENT=$(docker ps -a --filter "name=^/$WORKER_NAME$" -q)

echo "Looking for containers matching pattern: wslkindmultinodes with name containing: $WORKER_NAME"
echo "Found container ID: $DOCKER_CONTAINER_CURRENT"

if [ -z "$DOCKER_CONTAINER_CURRENT" ]; then
  echo "No container found for name pattern: wslkindmultinodes with name containing: $WORKER_NAME"
  exit 1
fi

# Copy the rootCA.crt to the container
docker cp rootCA.crt $DOCKER_CONTAINER_CURRENT:/usr/share/ca-certificates/

docker exec -it $DOCKER_CONTAINER_CURRENT /bin/bash