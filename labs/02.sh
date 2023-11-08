#!/bin/bash

## Answer:

#1
kubectl get pod

## Answer: 0


#2
## Answer:
kubectl run --image nginx nginx


#3
kubectl get pod

## Answer: 4


#4
kubectl describe pod newpods-4hn2t

## Answer: busybox


#5
kubectl describe pod newpods-4hn2t

## Node: controlplane/192.15.145.6
## Answer: controlplane


#6
kubectl describe pod webapp

## 1. nginx, 2. agentx
## Answer: 2


#7
kubectl describe pod webapp

## 1. nginx, 2. agentx
## Answer: nginx & agentx


#8
kubectl describe pod webapp

## State: Waiting
## Answer: Error or Waiting


#9

## Failed to pull image "agentx" ... failed to resolve reference "docker.io/library/agentx:latest"
## Answer: A Docker image with this name doesnt exist on Docker Hub

#10
kubectl get pods

## Answer: Running Containers/Total Containers

#11
## Answer:
kubectl delete pod webapp


#12
vim redis-pod.yaml

## Copy & paste
: '

apiapiVersion: v1
kind: Pod
metadata:
  name: redis
spec:
  containers:
  - name: redis
    image: redis123

'

## to save in vim: esc --> :wq

kubectl apply -f redis-pod.yaml

#13
kubectl edit pod redis
## edit image to redis
## save




