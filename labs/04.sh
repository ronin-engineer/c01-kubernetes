#!/bin/bash


#1
kubectl get pod

## Answer: 0


#2
kubectl get rs

## Answer: 0



#3
kubectl get deployment

## Answer: 0



#4
kubectl get deployment

## Answer: 1


#5
kubectl get rs

## Answer: 1


#6
kubectl get pod

## Answer: 4


#7
## all pod is ImagePullBackOff
## Answer: 0


#8
kubectl describe deployments frontend-deployment

## Answer: busybox888


#9
## Answer: the image busybox888 doesnt exist


#10
## Answer: 
vim /root/deployment-definition-1.yaml
## change kind from deployment to Deployment
## change image from busybox888 to busybox
kubectl apply -f /root/deployment-definition-1.yaml


#11
## Answer: 
vim frontend-deployment.yaml

## Copy & paste
: '

apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-frontend
  labels:
    type: frontend

spec:
  replicas: 3

  selector:
    matchLabels:
      type: frontend

  template:
    metadata:
      labels:
        type: frontend
    
    spec:
      containers:
        - name: frontend
          image: httpd:2.4-alpine

'

kubectl apply -f frontend-deployment.yaml
