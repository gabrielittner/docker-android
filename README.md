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

Alpine Linux OpenJDK 8:
- `tools-26.1.1-jdk8u181-alpine`
- `tools-26.1.1-jdk8-alpine`

OpenJDK 11:
- `tools-26.1.1-jdk11.0.1`
- `tools-26.1.1-jdk11`

OpenJDK 12:
- `tools-26.1.1-jdk12-ea-20`
- `tools-26.1.1-jdk12`

Older images can be found [on Docker Hub](https://hub.docker.com/r/gabrielittner/android-sdk/tags/).
