FROM openjdk:8-jdk

LABEL maintainer="gabriel.ittner@gmail.com"

# Install Deps
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --force-yes libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create new user
ARG username=worker
RUN groupadd -r ${username} && \
    useradd --create-home -r -g ${username} ${username}
USER ${username}

# Android SDK args
ARG android_home=/home/${username}/android-sdk
ARG sdk_version=sdk-tools-linux-4333796.zip
ARG sdk_license="8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e"
ARG sdk_license_preview="84831b9409646a918e30573bab4c9c91346d8abd"

# Accept Android SDK licenses
RUN mkdir -p "${android_home}/licenses" && \
    echo ${sdk_license} > "${android_home}/licenses/android-sdk-license" && \
    echo ${sdk_license_preview} > "${android_home}/licenses/android-sdk-preview-license"

# Download and install Android SDK
RUN mkdir -p ${android_home} && \
    curl --silent --show-error --location --fail --retry 3 --output /tmp/${sdk_version} https://dl.google.com/android/repository/${sdk_version} && \
    unzip -q /tmp/${sdk_version} -d ${android_home} && \
    rm /tmp/${sdk_version}

# Set environmental variables
ENV ANDROID_HOME ${android_home}
ENV ADB_INSTALL_TIMEOUT 120
ENV PATH=${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}
ENV TERM dumb
