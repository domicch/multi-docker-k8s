#!/bin/sh
kubectl apply -f kubernetes-dashboard.yaml

# then open in browser
#http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
