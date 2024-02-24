#!/bin/bash

#----------------------------------
#             Pod CLI
#----------------------------------
docker build -t service1:v1 ./container1

kubectl run --image=service1:v1 service1

kubectl get pod

kubectl get pod -o wide

# Describe pod
kubectl describe pod service1
# Status, IP, Port, Events, etc

# Show logs
kubectl logs -f service1

kubectl logs -f service1 -c container1

# Forward port
kubectl port-forward service1 8080:80


#----------------------------------
#             Pod YAML
#----------------------------------

# Delete old pods
kubectl delete pod service1

# Create pod for service 1
kubectl apply -f ./pod/pod1.yaml



#----------------------------------
#             Label
#----------------------------------

kubectl label pod service1 type=payment

kubectl get pod --show-labels

#----------------------------------
#             Service
#----------------------------------

# Create service
kubectl apply -f service/service1.yaml


# Get service
kubectl get svc


# Forward pod
kubectl port-forward service1 8080:80


#----------------------------------
#             Ingress
#----------------------------------

# Install ingress controller
# Check here: https://kubernetes.github.io/ingress-nginx/deploy/#quick-start

## Install Helm
brew install helm

# Update version kubernetes
# Make sure versions of kubernetes and nginx controller are compatiable

## Install nginx ingress controller
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml

kubectl get pod --all-namespaces

# Apply ingress
kubectl apply -f ./ingress/ingress.yaml

kubectl get ingress

# Test
# Check here: https://kubernetes.github.io/ingress-nginx/deploy/#local-testing

# Port forward ingress controller
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80

# Edit /etc/hosts
# Add a new line
## 127.0.0.1	s1.ronin-engineer.dev

# New terminal
curl --resolve s1.ronin-engineer.dev:8080:127.0.0.1 http://s1.ronin-engineer.dev:8080

