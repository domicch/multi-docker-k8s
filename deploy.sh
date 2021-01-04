#!/bin/bash

# build docker images
docker build -t domicch/multi_docker_k8s_client:latest -t domicch/multi_docker_k8s_client:$SHA -f ./client/Dockerfile ./client
docker build -t domicch/multi_docker_k8s_server:latest -t domicch/multi_docker_k8s_server:$SHA -f ./server/Dockerfile ./server
docker build -t domicch/multi_docker_k8s_worker:latest -t domicch/multi_docker_k8s_worker:$SHA -f ./worker/Dockerfile ./worker

# push images to git hub
docker push domicch/multi_docker_k8s_client:latest
docker push domicch/multi_docker_k8s_client:$SHA

docker push domicch/multi_docker_k8s_server:latest
docker push domicch/multi_docker_k8s_server:$SHA

docker push domicch/multi_docker_k8s_worker:latest
docker push domicch/multi_docker_k8s_worker:$SHA

# k8s stuff
kubectl apply -f k8s/project
# in order for k8s to "detect" latest built image, we tag the image with version identical to Git commit hash value
# So every time image is updated, kubectl will explicitly get latest image to deploy
kubectl set image deployment/server-deployment server=domicch/multi_docker_k8s_server:$SHA
kubectl set image deployment/client-deployment client=domicch/multi_docker_k8s_client:$SHA
kubectl set image deployment/worker-deployment worker=domicch/multi_docker_k8s_worker:$SHA
