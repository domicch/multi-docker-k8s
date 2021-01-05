#!/bin/bash
kubectl apply -f k8s

kubectl delete -f client-pod.yaml
kubectl delete -f client-node-port.yaml
kubectl delete -f client-deployment.yaml

kubectl describe pod client-pod

kubectl get pods
kubectl get services
kubectl get deployments


# update image
kubectl set image deployment/client-deployment client=domicch/complex_react_demo_client:v1

# get logs
kubectl logs --selector=component=web --tail 1