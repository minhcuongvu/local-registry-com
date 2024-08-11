#!/bin/bash
sudo mkdir -p /etc/docker/certs.d/local.registry.com:5000
sudo cp local.registry.com.pem /etc/docker/certs.d/local.registry.com:5000/ca.crt