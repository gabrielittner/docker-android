# Android SDK Docker images

All images are based on different OpenJDK images from [https://hub.docker.com/_/openjdk/].

## What's installed
- OpenJDK (for version see below)
- Android SDK tools (for version see the number after `tools-` in the tag)
- Android SDK license
- Android SDK preview license
- `ANDROID_HOME` env var is set
- appropriate Android SDK directories are added to `PATH`

## Available tags

OpenJDK 8:
- `tools-26.1.1-jdk8u181`
- `tools-26.1.1-jdk8`

OpenJDK 8 Alpine Linux:
- `tools-26.1.1-jdk8u191-alpine`
- `tools-26.1.1-jdk8-alpine`

OpenJDK 11:
- `tools-26.1.1-jdk11.0.2`
- `tools-26.1.1-jdk11`

AdoptOpenJDK 8:
- `tools-26.1.1-adoptjdk8u202`
- `tools-26.1.1-adoptjdk8`

AdoptOpenJDK 8 Alpine Linux:
- `tools-26.1.1-adoptjdk8u202-alpine`
- `tools-26.1.1-adoptjdk8-alpine`

AdoptOpenJDK 11:
- `tools-26.1.1-adoptjdk11.0.2`
- `tools-26.1.1-adoptjdk11`

AdoptOpenJDK 11 Alpine Linux:
- `tools-26.1.1-adoptjdk11.0.2-alpine`
- `tools-26.1.1-adoptjdk11-alpine`

Older images can be found [on Docker Hub](https://hub.docker.com/r/gabrielittner/android-sdk/tags/).
