FROM alpine:3.8

# Android SDK location
ARG android_home=/android-sdk
RUN mkdir -p ${android_home}/cmdline-tools
RUN mkdir -p ${android_home}/licenses

# Download and install Android SDK
ARG CMDLINE_TOOLS_REVISION=none
ARG sdk_file=commandlinetools-linux-${CMDLINE_TOOLS_REVISION}.zip
RUN wget -q -O /tmp/${sdk_file} https://dl.google.com/android/repository/${sdk_file}
RUN unzip -qo /tmp/${sdk_file} -d ${android_home}/cmdline-tools
RUN mv ${android_home}/cmdline-tools/cmdline-tools ${android_home}/cmdline-tools/latest

# Accept Android SDK licenses
RUN echo -e "24333f8a63b6825ea9c5514f83c2829b004d1fee\n" > "${android_home}/licenses/android-sdk-license"
RUN echo -e "84831b9409646a918e30573bab4c9c91346d8abd\n" > "${android_home}/licenses/android-sdk-preview-license"
