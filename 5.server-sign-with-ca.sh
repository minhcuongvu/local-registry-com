# local.registry.com.crt
openssl x509 -req -in out/local.registry.com.csr -CA out/rootCA.crt -CAkey out/rootCA.key -CAcreateserial -out out/local.registry.com.crt -days 500 -sha256 -extfile local.registry.com.cnf -extensions v3_ca

# check the new .crt file content
openssl x509 -in out/local.registry.com.crt -text -noout