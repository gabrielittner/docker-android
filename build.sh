#!/bin/bash
set -e

SDK_TOOLS_VERSION=26.1.1
SDK_TOOLS_REVISION=4333796

TAG_BASE=gabrielittner/android-sdk:tools-${SDK_TOOLS_VERSION}

TAG_VERSION_SHORT=(
  jdk8
  jdk11
  jdk14
  adoptjdk8
  adoptjdk11
  adoptjdk14
)
TAG_VERSION_FULL=(
  jdk8u262
  jdk11.0.8
  jdk14.0.2
  adoptjdk8u252
  adoptjdk11.0.7
  adoptjdk14.0.1
)
JDK_IMAGE=(
  openjdk:8u262-jdk-buster
  openjdk:11.0.8-jdk-buster
  openjdk:14.0.2-jdk-buster
  adoptopenjdk:8u252-b09-jdk-hotspot
  adoptopenjdk:11.0.7_10-jdk-hotspot
  adoptopenjdk:14.0.1_7-jdk-hotspot
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
