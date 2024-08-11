# setup-nodes.sh

```shell
# mkcert searches in /usr/share/ca-certificates/
docker cp rootCA.crt $DOCKER_CONTAINER_CURRENT:/usr/share/ca-certificates/

docker exec -it $DOCKER_CONTAINER_CURRENT /bin/bash
# apt update && apt install nano
# mkdir -p /etc/containerd/certs.d/https://local.registry.com:32555
# nano /etc/containerd/certs.d/https://local.registry.com:32555/hosts.toml
```

following [this answer on stackoverflow](https://stackoverflow.com/a/74695141)

```shell
# inside the docker nodes 
# apt update && apt install nano
# mkdir -p /etc/containerd/certs.d/https://local.registry.com:32555
# nano /etc/containerd/certs.d/https://local.registry.com:32555/hosts.toml
server = "https://local.registry.com:32555"


[host."https://local.registry.com:32555"]
  capabilities = ["pull", "resolve"]
  skip_verify = true

# nano /etc/containerd/config.toml
[plugins."io.containerd.grpc.v1.cri".registry]
  config_path = "/etc/containerd/certs.d"

# systemctl restart containerd
# journalctl -u docker -f
```
