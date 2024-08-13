#!/bin/bash
sudo mkdir -p /etc/docker/certs.d/local.registry.com:32555
sudo cp local.registry.com.pem /etc/docker/certs.d/local.registry.com:32555/ca.crt