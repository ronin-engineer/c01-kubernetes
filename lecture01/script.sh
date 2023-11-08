#!/bin/bash

#----------------------------------
#              Env
#----------------------------------
cd ./01-configuration

# Create pod with env
kubectl apply -f 00-env-pod.yaml

# Inspect pod
kubectl exec -it env-pod -- sh

## Container shell
echo $DB_URL
exit



#----------------------------------
#           ConfigMap
#----------------------------------

# Create configmap with command
kubectl create configmap s1-config-01 --from-literal DB_URL=jdbc:mysql://ronin_db:3306

# Create a pod using configmap s1-config-01
kubectl apply -f 01-configmap-pod.yaml

# Inspect pod
kubectl exec -it configmap-pod -- sh

## Container shell
echo $DB_URL
exit

# Create configmap using manifest
kubectl apply -f 02-configmap.yaml

# Recreate pod
kubectl delete pod configmap-pod

kubectl apply -f 03-two-configmap-pod.yaml

## Inspect pod
kubectl exec -it configmap-pod -- sh

### Container shell
echo $CACHE_URL
exit


#----------------------------------
#               Secret
#----------------------------------
# Method 1: Create secret using command
kubectl create secret generic s1-secret-01 --from-literal DB_PASSWOR=pass

# Method 2: Create secret using manifest

## Encode base64
echo "pass" | base64

## Decode base64
echo "cGFzcwo=" | base64 --decode

## Create secret
kubectl apply -f 04-secret.yaml

# Create new pod
kubectl apply -f 05-full-config-pod.yaml

## Inspect
kubectl exec -it full-config-pod -- sh

### Test
echo $DB_PASSWORD
echo $DB_URL
exit

# Clear pods
kubectl delete pod --all

#----------------------------------
#           ReplicaSet
#----------------------------------
cd ../02-replicaset

## Create pods
kubectl apply -f pod/s1-pod1.yaml
kubectl apply -f pod/s1-pod2.yaml
kubectl apply -f pod/s1-pod3.yaml

# Create service
kubectl apply -f service1.yaml

# Try to delete pod
kubectl delete pod service1-03

kubectl delete pod --all

# Create replicaset
kubectl apply -f rs/s1-rs.yaml

# Test
kubectl get pod
kubectl delete pod service1-rs-xfjrs    # replace the pod name
## Right after deleting a pod, a new pod is created
kubectl get pod

# Scale Replica Set
kubectl scale --replicas 2 replicaset service1-rs
kubectl scale --replicas 5 replicaset service1-rs

# Delete replicaset
kubectl delete rs service1-rs


#----------------------------------
#           Deployment
#----------------------------------
cd ../03-deployment

# Create deployment
kubectl apply -f s1-deployment.yaml

# Test
kubectl get deployment
kubectl get pod

# Scale down
kubectl scale --replicas 6 deployment s1-deployment

kubectl describe deployments s1-deployment

kubectl get pod

# Scale up
kubectl scale --replicas 10 deployment s1-deployment

kubectl get pod

# Rolling Update
curl http://s1.ronin-engineer.dev

## Method 1: update image using command
### Please prepare image service1:v2 in /lecture00/container01
kubectl set image deployment/s1-deployment service1=service1:v2

kubectl rollout status deployment s1-deployment

kubectl rollout history deployment s1-deployment

curl http://s1.ronin-engineer.dev

## Method 2: edit image in deployment manifest
### Please prepare 
kubectl edit deployments s1-deployment

kubectl rollout status deployment s1-deployment

kubectl rollout history deployment s1-deployment

curl http://s1.ronin-engineer.dev

# Roll Back

kubectl rollout undo deployment s1-deployment

kubectl rollout status deployment s1-deployment

kubectl rollout history deployment s1-deployment

curl http://s1.ronin-engineer.dev

# Roll Back to a specific revision
kubectl rollout undo deployment s1-deployment --to-revision 1


# Delete deployment
kubectl delete deployment s1-deployment


# Happy hacking!
# You are amazing!