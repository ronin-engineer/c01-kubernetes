#!/bin/bash


#----------------------------------
#           Autoscaling
#----------------------------------

# Install metrics server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml


# Create a deployment
kubectl apply -f frontend-deployment.yaml


# Create service to expose the above deployment
kubectl expose deployment frontend --port 80


# Autoscale
kubectl autoscale deployment frontend --cpu-percent=50 --min=2 --max=10

# Check
kubectl get hpa

kubectl describe horizontalpodautoscalers.autoscaling frontend


# Test

## Create a "load-generator" pod
kubectl run -i --tty load-generator --image=busybox /bin/sh

## Generate load
while true; do wget -q -O- http://frontend; done

## Open new terminal tab
kubectl get hpa --watch
