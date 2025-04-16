#!/bin/bash

# Set the namespace (optional)
NAMESPACE="default"

# Apply the Kubernetes manifests
kubectl apply -f ../manifests/deployment.yaml -n $NAMESPACE
kubectl apply -f ../manifests/service.yaml -n $NAMESPACE
kubectl apply -f ../manifests/ingress.yaml -n $NAMESPACE

# Check the status of the deployment
kubectl rollout status deployment/heart-animation -n $NAMESPACE

# Optional: Wait for the pods to be ready
kubectl wait --for=condition=ready pod -l app=heart-animation -n $NAMESPACE --timeout=60s

echo "Deployment completed successfully!"