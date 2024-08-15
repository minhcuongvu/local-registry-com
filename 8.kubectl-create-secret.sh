#!/bin/bash
cp out/local.registry.com.crt local.registry.com.crt 
cp out/local.registry.com.key local.registry.com.key 

kubectl delete secret registry-tls
kubectl create secret tls registry-tls \
  --cert=local.registry.com.crt \
  --key=local.registry.com.key \
  # --namespace=kube-system

kubectl create secret generic registry-auth \
  --from-file=out/htpasswd