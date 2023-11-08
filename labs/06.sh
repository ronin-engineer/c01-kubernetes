#!/bin/bash


#1
kubectl get service

## Answer: 1


#2
## No Answer


#3
## Answer: ClusterIP


#4
kubectl describe service kubernetes

## Answer: 6443


#5
## Answer: 2


#6
## Endpoints: 192.19.226.6:6443
## Answer: 1


#7
kubectl get deployments

## Answer: 1


#8
kubectl describe deployments simple-webapp-deployment

## Answer: kodekloud/simple-webapp:red


#9
## 502
## Answer: No


#10
## Answer: 
vim service-definition-1.yaml

## Copy & paste
: '
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
  namespace: default
spec:
  ports:
  - nodePort: 30080
    port: 8080
    targetPort: 8080
  selector:
    name: simple-webapp
  type: NodePort
'

kubectl apply -f service-definition-1.yaml


#11
## No Answer