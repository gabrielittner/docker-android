ARG SDK_TOOLS_IMAGE=none
ARG JDK_IMAGE=none

FROM ${SDK_TOOLS_IMAGE} as android-sdk-tools

FROM ${JDK_IMAGE}

LABEL maintainer="gabriel.ittner@gmail.com"

# Create new user
ARG username=worker
RUN groupadd -r ${username} && \
    useradd --create-home -r -g ${username} ${username}
USER ${username}

# Android SDK
ARG android_home=/home/${username}/android-sdk
COPY --chown=worker --from=android-sdk-tools /android-sdk ${android_home}

# Set environmental variables
ENV ANDROID_HOME ${android_home}
ENV ADB_INSTALL_TIMEOUT 120
ENV PATH=${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}
ENV TERM dumb
