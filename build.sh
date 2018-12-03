#!/bin/bash
set -e

SDK_TOOLS_VERSION=26.1.1
SDK_TOOLS_REVISION=4333796

TAG_BASE=gabrielittner/android-sdk:tools-${SDK_TOOLS_VERSION}

TAG_VERSION_SHORT=(
  jdk8
  jdk8-alpine
  jdk11
  jdk12
  adoptjdk8
  adoptjdk8-alpine
  adoptjdk11
  adoptjdk11-alpine
)
TAG_VERSION_FULL=(
  jdk8u181
  jdk8u181-alpine
  jdk11.0.1
  jdk12-ea-22
  adoptjdk8u192
  adoptjdk8u192-alpine
  adoptjdk11.0.1
  adoptjdk11.0.1-alpine
)
JDK_IMAGE=(
  openjdk:8u181
  openjdk:8u181-alpine
  openjdk:11.0.1
  openjdk:12-ea-22
  adoptopenjdk/openjdk8:jdk8u192-b12
  adoptopenjdk/openjdk8:jdk8u192-b12-alpine
  adoptopenjdk/openjdk11:jdk-11.0.1.13
  adoptopenjdk/openjdk11:jdk-11.0.1.13-alpine
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
