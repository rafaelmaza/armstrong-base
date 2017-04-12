#!/usr/bin/env bash
if [ `docker images -q gragonmau/armstrong-base` ]; then
  echo 'There is already image assigned to this tag. Rebuilding...'
  docker rmi -f gragonmau/armstrong-base
fi

echo 'Building image...'  
docker build -t gragonmau/armstrong-base .
echo 'Pushing image to Docker Hub'
docker push gragonmau/armstrong-base