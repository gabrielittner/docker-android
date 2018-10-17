#!/bin/bash
set -e

SDK_TOOLS_VERSION=26.1.1
SDK_TOOLS_REVISION=4333796

VERSIONS_SHORT=( 8 8-alpine 10 11 12 )
VERSIONS_FULL=( 8u181 8u171-alpine 10.0.2 11.0.1 12-ea-16)

SDK_TOOLS_IMAGE=android-sdk-tools-${SDK_TOOLS_VERSION}
echo "================================================"
echo "Building base SDK tools image ${SDK_TOOLS_IMAGE}"
echo "================================================"
docker build \
    --pull \
    --tag ${SDK_TOOLS_IMAGE} \
    --build-arg SDK_TOOLS_REVISION=${SDK_TOOLS_REVISION} \
    sdk-tools

TAG_BASE=gabrielittner/android-sdk:tools-${SDK_TOOLS_VERSION}
for ((i=0;i<${#VERSIONS_SHORT[@]};++i)); do
    TAG_SIMPLE=${TAG_BASE}-jdk${VERSIONS_SHORT[i]}
    TAG_FULL=${TAG_BASE}-jdk${VERSIONS_FULL[i]}
    echo "================================================"
    echo "Building ${TAG_FULL} image"
    echo "================================================"

    docker build \
        --tag ${TAG_SIMPLE} \
        --tag ${TAG_FULL} \
        --build-arg SDK_TOOLS_IMAGE=${SDK_TOOLS_IMAGE} \
        --build-arg JDK_VERSION=${VERSIONS_FULL[i]} \
        jdk${VERSIONS_SHORT[i]}

    docker push ${TAG_SIMPLE}
    docker push ${TAG_FULL}
done
