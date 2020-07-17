FROM alpine:3.8

# Android SDK location
ARG android_home=/android-sdk
RUN mkdir -p ${android_home}

# Accept Android SDK licenses
RUN mkdir -p ${android_home}/licenses
ARG sdk_license="d56f5187479451eabf01fb78af6dfcb131a6481e\n24333f8a63b6825ea9c5514f83c2829b004d1fee\n"
RUN echo -e ${sdk_license} > "${android_home}/licenses/android-sdk-license"
ARG sdk_license_preview="84831b9409646a918e30573bab4c9c91346d8abd\n"
RUN echo -e ${sdk_license_preview} > "${android_home}/licenses/android-sdk-preview-license"

# Download and install Android SDK
ARG CMDLINE_TOOLS_REVISION=none
ARG sdk_file=commandlinetools-linux-${CMDLINE_TOOLS_REVISION}.zip
RUN wget -q -O /tmp/${sdk_file} https://dl.google.com/android/repository/${sdk_file}
RUN unzip -q /tmp/${sdk_file} -d ${android_home}
RUN mkdir ${android_home}/cmdline-tools
RUN mv ${android_home}/tools ${android_home}/cmdline-tools/latest
