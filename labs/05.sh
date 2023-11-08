#!/bin/bash


#1
## Answer: 
kubectl get pod
kubectl describe pod frontend-58f7796bbb-5z8xb


#2
## click to Webbapp Portal in top right corner
## Answer: blue


#3
## Answer: 
/root/curl-test.sh
## wait


#4
kubectl get deployments
kubectl describe deployments frontend

## Answer: 4


#5
## Answer: kodekloud/webapp-color:v1


#6
## Answer: RollingUpdate


#7
## Answer: Pods are upgrade few at a time


#8
## Answer: 
kubectl edit deployments frontend
## Change image to kodekloud/webapp-color:v2



#9
/root/curl-test.sh

## Answer: 


#10
## 25% max unavailable x 4 replicas = 1

## Answer: 1


#11
## Answer: 
kubectl edit deployments frontend
## change strategy.type to Recreate
## remove strategy.rollingUpdate


#12
## Answer: 
kubectl set image deployment/frontend simple-webapp=kodekloud/webapp-color:v3


#13
/root/curl-test.sh
## Answer: 