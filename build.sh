#!/bin/bash
set -e

TAG_BASE=gabrielittner/android-sdk:tools-26.1.1

VERSIONS=( 8 8-alpine 10 )
VERSIONS_FULL=( 8u171 8u171-alpine 10.0.1-10 )

DEFAULT_VERSION=8
DEFAULT_VERSION_ALPINE=8-alpine

for ((i=0;i<${#VERSIONS[@]};++i)); do
    TAG_SIMPLE=${TAG_BASE}-jdk${VERSIONS[i]}
    TAG_FULL=${TAG_BASE}-jdk${VERSIONS_FULL[i]}
    
    docker build \
        --pull \
        --tag ${TAG_SIMPLE} \
        --tag ${TAG_FULL} \
        --build-arg JDK_VERSION=${VERSIONS_FULL[i]} \
        jdk${VERSIONS[i]}
    
    if [ "${VERSIONS[i]}" == "${DEFAULT_VERSION}" ]; then
        docker tag ${TAG_FULL} ${TAG_BASE} 
        docker push ${TAG_BASE} 
    fi
    
    if [ "${VERSIONS[i]}" == "${DEFAULT_VERSION_ALPINE}" ]; then
        docker tag ${TAG_FULL} ${TAG_BASE}-alpine
        docker push ${TAG_BASE}-alpine
    fi

    docker push ${TAG_SIMPLE}
    docker push ${TAG_FULL}
done
