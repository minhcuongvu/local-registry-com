#!/bin/bash

# Set the IP address in the HOST_IP environment variable
HOST_IP="local.registry.com"

# Encode the certificate and key files to base64
base64 -w 0 "${HOST_IP}.pem" > "${HOST_IP}.pem.base64"
base64 -w 0 "${HOST_IP}-key.pem" > "${HOST_IP}-key.pem.base64"

echo "Done."