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

OpenJDK 8 (8u171):
- `tools-26.1.1-jdk8u171`
- `tools-26.1.1-jdk8`
- `tools-26.1.1`

Alpine Linux OpenJDK 8 (8u171):
- `tools-26.1.1-jdk8u171-alpine`
- `tools-26.1.1-jdk8-alpine`
- `tools-26.1.1-alpine`

OpenJDK 10 (10.0.1-10):
- `tools-26.1.1-jdk10.0.1-10`
- `tools-26.1.1-jdk10`
