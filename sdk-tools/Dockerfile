FROM alpine:3.8

# Android SDK location
ARG android_home=/android-sdk
RUN mkdir -p ${android_home} 

# Accept Android SDK licenses
RUN mkdir -p ${android_home}/licenses
ARG sdk_license="d56f5187479451eabf01fb78af6dfcb131a6481e"
RUN echo ${sdk_license} > "${android_home}/licenses/android-sdk-license"
ARG sdk_license_preview="84831b9409646a918e30573bab4c9c91346d8abd"
RUN echo ${sdk_license_preview} > "${android_home}/licenses/android-sdk-preview-license"

# Download and install Android SDK
ARG SDK_TOOLS_REVISION=none
ARG sdk_file=sdk-tools-linux-${SDK_TOOLS_REVISION}.zip
RUN wget -q -O /tmp/${sdk_file} https://dl.google.com/android/repository/${sdk_file}
RUN unzip -q /tmp/${sdk_file} -d ${android_home}
