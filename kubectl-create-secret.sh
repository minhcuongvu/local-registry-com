#!/bin/bash
kubectl delete secret registry-tls
kubectl create secret tls registry-tls \
  --cert=local.registry.com.crt \
  --key=local.registry.com.key \
  # --namespace=kube-system
