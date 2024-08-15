# rootCA.crt
openssl req -x509 -new -nodes -key out/rootCA.key -sha256 -days 365 -out out/rootCA.crt -subj "/C=US/ST=YourState/L=YourCity/O=YourOrg/OU=YourUnit/CN=local.registry.com"
