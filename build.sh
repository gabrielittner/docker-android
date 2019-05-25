#!/bin/bash
set -e

SDK_TOOLS_VERSION=26.1.1
SDK_TOOLS_REVISION=4333796

TAG_BASE=gabrielittner/android-sdk:tools-${SDK_TOOLS_VERSION}

TAG_VERSION_SHORT=(
  jdk8
  jdk11
  adoptjdk8
  adoptjdk11
)
TAG_VERSION_FULL=(
  jdk8u212
  jdk11.0.3
  adoptjdk8u212
  adoptjdk11.0.3
)
JDK_IMAGE=(
  openjdk:8u212-b04-jdk-stretch
  openjdk:11.0.3-jdk-stretch
  adoptopenjdk:8u212-b03-jdk-hotspot
  adoptopenjdk:11.0.3_7-jdk-hotspot
)

SDK_TOOLS_IMAGE=android-sdk-tools-${SDK_TOOLS_VERSION}
echo "================================================"
echo "Building base SDK tools image ${SDK_TOOLS_IMAGE}"
echo "================================================"
docker build \
    --pull \
    --tag ${SDK_TOOLS_IMAGE} \
    --build-arg SDK_TOOLS_REVISION=${SDK_TOOLS_REVISION} \
    sdk-tools

for ((i=0;i<${#JDK_IMAGE[@]};++i)); do
    TAG_SIMPLE=${TAG_BASE}-${TAG_VERSION_SHORT[i]}
    TAG_FULL=${TAG_BASE}-${TAG_VERSION_FULL[i]}

    echo "================================================"
    echo "Building ${TAG_FULL} image"
    echo "================================================"

    docker build \
        --tag ${TAG_SIMPLE} \
        --tag ${TAG_FULL} \
        --build-arg SDK_TOOLS_IMAGE=${SDK_TOOLS_IMAGE} \
        --build-arg JDK_IMAGE=${JDK_IMAGE[i]} \
        ${TAG_VERSION_SHORT[i]}

    docker push ${TAG_SIMPLE}
    docker push ${TAG_FULL}
done
