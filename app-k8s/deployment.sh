#!/bin/bash

#mysql k8s deployment files
kubectl apply -f /tmp/secret.yaml
kubectl apply -f /tmp/pv.yaml
kubectl apply -f /tmp/pvc.yaml
kubectl apply -f /tmp/deployment.yaml
kubectl apply -f /tmp/service.yaml

kubectl apply -f /tmp/app-deployment.yaml
sudo sleep 10
kubectl expose deployment/case --type="NodePort" --port 8080
sudo sleep 10
export NODE_PORT=$(kubectl get services/case -o go-template='{{(index .spec.ports 0).nodePort}}')
export NODE_IP=$(kubectl get node -o wide | tail -n 1 | awk '{print $6}')
curl <NODE_IP>:$NODE_PORT