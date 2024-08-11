#!/bin/bash

# replace your sha here
SHA=sha256:abcdef123456...

curl -X DELETE \
    https://local.registry.com:32555/v2/springhello/blobs/$SHA
