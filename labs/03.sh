#!/bin/bash


#


## Answer: 

#1
kubectl get pod

## Answer: 0


#2
kubectl get replicasets

## Answer: 0


#3
kubectl get replicasets

## Answer: 1


#4
## Answer: 4


#5
kubectl describe rs new-replica-set

## Answer: busybox777


#6
## Answer: 0


#7
kubectl get pod
kubectl describe pod new-replica-set-cd82m
## failed to resolve reference "docker.io/library/busybox777:latest"
## Answer: the image busybox777


#8
## Answer: 
kubectl delete pod new-replica-set-cd82m


#9
kubectl get pod

## Answer: 4


#10
## Answer: ReplicaSet ensures t hat desired number of PODs always run


#11
## Answer: 
vim /root/replicaset-definition-1.yaml
## fix apiVersion: apps/v1
kubectl apply -f /root/replicaset-definition-1.yaml



#12
## Answer: 
vim /root/replicaset-definition-2.yaml
## selector and label in pod must be matched
## change label nginx --> frontend
kubectl apply -f /root/replicaset-definition-2.yaml


#13
## Answer:
kubectl delete rs replicaset-1
kubectl delete rs replicaset-2


#14
## Answer: 
kubectl edit rs new-replica-set
## change image to busybox
## delete pods to recreate new pods with the new image
kubectl delete pod --all


#15
## Answer: 
kubectl scale --replicas 5 rs new-replica-set


#16
## Answer:
kubectl scale --replicas 2 rs new-replica-set