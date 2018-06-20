#!/bin/bash
TAG_BASE=gabrielittner/android-sdk:tools-26.1.1

VERSIONS=( jdk8 jdk8-alpine jdk10 )
VERSIONS_FULL=( jdk8u171 jdk8u171-alpine jdk10.0.1-10 )

for ((i=0;i<${#VERSIONS[@]};++i)); do
    docker build --pull --tag ${TAG_BASE}-${VERSIONS[i]} --tag ${TAG_BASE}-${VERSIONS_FULL[i]} ${VERSIONS[i]}
    docker push ${TAG_BASE}-${VERSIONS[i]}
    docker push ${TAG_BASE}-${VERSIONS_FULL[i]}
done

# default image
docker tag ${TAG_BASE}-jdk8 ${TAG_BASE} 
docker push gabrielittner/android-sdk:tools-26.1.1 

# default alpine image
docker tag ${TAG_BASE}-jdk8-alpine ${TAG_BASE}-alpine
docker push gabrielittner/android-sdk:tools-26.1.1-alpine
