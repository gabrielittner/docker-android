ARG SDK_TOOLS_IMAGE=none
ARG JDK_IMAGE=none

FROM ${SDK_TOOLS_IMAGE} as android-sdk-tools

FROM ${JDK_IMAGE}

LABEL maintainer="gabriel.ittner@gmail.com"

# Install dependencies
# git and openssh-client for CircleCI
# glibc from https://github.com/sgerrand/alpine-pkg-glibc/
RUN apk --no-cache add ca-certificates git openssh-client && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
    apk --no-cache add glibc-2.28-r0.apk && \
    rm -f /etc/apk/keys/sgerrand.rsa.pub

# Create new user
ARG username=worker
RUN addgroup ${username} && \
    adduser -D -G ${username} ${username}
USER ${username}

# Android SDK
ARG android_home=/home/${username}/android-sdk
COPY --chown=worker --from=android-sdk-tools /android-sdk ${android_home}

# Set environmental variables
ENV ANDROID_HOME ${android_home}
ENV ADB_INSTALL_TIMEOUT 120
ENV PATH=${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}
ENV TERM dumb
