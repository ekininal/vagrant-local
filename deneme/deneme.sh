#!/bin/bash

kubectl apply -f /tmp/deployment.yaml
sudo sleep 50
kubectl expose deployment/deneme --type="NodePort" --port 8080
sudo sleep 50
export NODE_PORT=$(kubectl get services/deneme -o go-template='{{(index .spec.ports 0).nodePort}}')
export NODE_IP=$(kubectl get node -o wide | tail -n 1 | awk '{print $6}')
curl <NODE_IP>:$NODE_PORT