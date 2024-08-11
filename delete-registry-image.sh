#!/bin/bash
# Set the registry URL and image details
HTTP=http://
HTTPS=https://
REGISTRY_URL="local.registry.com:32555"
IMAGE_NAME="springhello"
TAG="release"

# Step 1: Get the manifest for the specified tag
MANIFEST=$(curl -s -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
    "$HTTPS${REGISTRY_URL}/v2/${IMAGE_NAME}/manifests/${TAG}")

echo "Manifest Response:"
echo "$MANIFEST"

# Step 2: Extract the config digest
CONFIG_DIGEST=$(echo "$MANIFEST" | jq -r .config.digest)

echo "Config Digest:"
echo "$CONFIG_DIGEST"

# Step 3: Remove the tag
DELETE_CONFIG_RESPONSE=$(curl --http0.9 -v -X DELETE "$HTTP${REGISTRY_URL}/v2/${IMAGE_NAME}/manifests/${CONFIG_DIGEST}" --output -)

echo "Delete Config Response:"
echo "$DELETE_CONFIG_RESPONSE"

# Step 4: Remove the tag reference (optional, if using v2.7.0+)
DIGEST=$(curl -s -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
    "$HTTP${REGISTRY_URL}/v2/${IMAGE_NAME}/manifests/${TAG}" | jq -r .digest)

echo "Tag Digest:"
echo "$DIGEST"

DELETE_TAG_RESPONSE=$(curl --http0.9 -v -X DELETE "${HTTP}${REGISTRY_URL}/v2/${IMAGE_NAME}/manifests/${DIGEST}" --output -)

echo "Delete Tag Response:"
echo "$DELETE_TAG_RESPONSE"
