#!/bin/bash

#mysql k8s deployment files
kubectl apply -f /tmp/secret.yaml
kubectl apply -f /tmp/pv.yaml
kubectl apply -f /tmp/pvc.yaml
kubectl apply -f /tmp/deployment.yaml
kubectl apply -f /tmp/service.yaml

#app deployment files
kubectl apply -f /tmp/app-secret.yaml
kubectl apply -f /tmp/app-deployment.yaml
sudo sleep 10
export NODE_IP=$(kubectl get pod -o wide | awk '{print $6}' | sed -n '2p')
curl <NODE_IP>:3000