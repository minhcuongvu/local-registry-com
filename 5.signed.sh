# local.registry.com.crt
openssl x509 -req -in local.registry.com.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out local.registry.com.crt -days 500 -sha256 -extfile local.registry.com.cnf -extensions v3_ca
