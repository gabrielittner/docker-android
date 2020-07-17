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
- `cmdline-tools-2.1-jdk8u262`
- `cmdline-tools-2.1-jdk8`

OpenJDK 11:
- `cmdline-tools-2.1-jdk11.0.8`
- `cmdline-tools-2.1-jdk11`

OpenJDK 12:
- `cmdline-tools-2.1-jdk14.0.2`
- `cmdline-tools-2.1-jdk14`

AdoptOpenJDK 8:
- `cmdline-tools-2.1-adoptjdk8u252`
- `cmdline-tools-2.1-adoptjdk8`

AdoptOpenJDK 11:
- `cmdline-tools-2.1-adoptjdk11.0.7`
- `cmdline-tools-2.1-adoptjdk11`

AdoptOpenJDK 12:
- `cmdline-tools-2.1-adoptjdk14.0.1`
- `cmdline-tools-2.1-adoptjdk14`


Older images can be found [on Docker Hub](https://hub.docker.com/r/gabrielittner/android-sdk/tags/).
