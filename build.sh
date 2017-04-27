#!/usr/bin/env bash

if [ -z "$1" ]
then
      TAG=''
else
      TAG=":$1"
fi

if [ `docker images -q gragonmau/armstrong-base` ]; then
  echo 'There is already image assigned to this tag. Rebuilding...'
  docker rmi -f gragonmau/armstrong-base
fi

echo 'Building image...' 
docker build -t gragonmau/armstrong-base"$TAG" .
echo 'Pushing image to Docker Hub'
docker push gragonmau/armstrong-base