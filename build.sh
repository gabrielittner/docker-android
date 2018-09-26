#!/bin/bash
set -e

SDK_TOOLS_VERSION=26.1.1
SDK_TOOLS_REVISION=4333796

VERSIONS_SHORT=( 8 8-alpine 10 11 )
VERSIONS_FULL=( 8u181 8u171-alpine 10.0.2-13 11-ea-28)

TAG_BASE=gabrielittner/android-sdk:tools-${SDK_TOOLS_VERSION}

docker build \
    --pull \
    --tag android-sdk-tools \
    --build-arg SDK_TOOLS_REVISION=${SDK_TOOLS_REVISION} \
    sdk-tools

for ((i=0;i<${#VERSIONS_SHORT[@]};++i)); do
    TAG_SIMPLE=${TAG_BASE}-jdk${VERSIONS_SHORT[i]}
    TAG_FULL=${TAG_BASE}-jdk${VERSIONS_FULL[i]}

    docker build \
        --tag ${TAG_SIMPLE} \
        --tag ${TAG_FULL} \
        --build-arg JDK_VERSION=${VERSIONS_FULL[i]} \
        jdk${VERSIONS_SHORT[i]}

    docker push ${TAG_SIMPLE}
    docker push ${TAG_FULL}
done
