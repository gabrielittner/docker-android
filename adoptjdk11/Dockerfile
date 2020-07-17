ARG CMDLINE_TOOLS_IMAGE=none
ARG JDK_IMAGE=none

FROM ${CMDLINE_TOOLS_IMAGE} as android-sdk-tools

FROM ${JDK_IMAGE}

# Install git and openssh-client for CircleCI
RUN apt-get update \
    && apt-get install -y --no-install-recommends git openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Android SDK
ARG android_home=/android-sdk
COPY --from=android-sdk-tools /android-sdk ${android_home}

# Set environmental variables
ENV ANDROID_HOME ${android_home}
ENV ADB_INSTALL_TIMEOUT 120
ENV PATH=${ANDROID_HOME}/emulator:${ANDROID_HOME}/cmdline-tools/latest:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${PATH}
ENV TERM dumb
