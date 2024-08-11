#!/bin/bash
registry='local.registry.com:32555'
name='springhello'
auth='-u registry:pwd'
tag='release'
curl $auth -v -X DELETE -sI -k "https://${registry}/v2/${name}/manifests/$(
  curl $auth -sI -k \
    -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
    "https://${registry}/v2/${name}/manifests/${tag}" \
    | tr -d '\r' | sed -En 's/^Docker-Content-Digest: (.*)/\1/pi'
)"
