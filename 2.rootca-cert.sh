# rootCA.pem
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem -subj "/C=US/ST=YourState/L=YourCity/O=YourOrg/OU=YourUnit/CN=YourRootCA"
