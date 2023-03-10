#!/usr/bin/env bash
set -eu

os=alpine
release="0.1.0"
name=nginx
org=uvoo
docker build --tag $org/$name:latest --tag $org/$name:$release --tag "$org/$name:$release-$os" .
echo Push to docker repo in 5 seconds; sleep 5
echo $DOCKERHUB_USERTOKEN | docker login -u $DOCKERHUB_USERNAME --password-stdin
# echo $DOCKERHUB_TOKEN | docker login --username $DOCKERHUB_USERNAME --password-stdin
docker push $org/$name:$release
docker push $org/$name:latest
docker push "$org/$name:$release-$os"
docker logout
