# Copy the rootCA.pem to the trusted certificates directory
sudo cp out/rootCA.crt /usr/local/share/ca-certificates/rootCA.crt

# Update the trusted certificates
sudo update-ca-certificates

# verify
openssl x509 -in /usr/local/share/ca-certificates/rootCA.crt -text -noout

# test the HTTPS
# curl -v https://local.registry.com:32555
