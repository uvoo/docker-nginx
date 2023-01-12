#!/usr/bin/env bash
set -e

echo "Build and push docker container to Dockerhub."
release=0.1.0
name=nginx-alpine
org=uvoo
docker build --tag $org/$name:latest --tag $org/$name:$release .
echo Push to docker repo in 5 seconds; sleep 5
echo $DOCKERHUB_TOKEN | docker login --username $DOCKERHUB_USERNAME --password-stdin
docker push $org/$name:$release
docker push $org/$name:latest
docker logout
