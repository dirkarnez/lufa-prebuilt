# # create an up-to-date base image for everything
# FROM alpine:latest AS base

# RUN \
#   apk --no-cache --update-cache upgrade

# # run-time dependencies
# RUN \
#   apk --no-cache add \
#     bash \
#     curl \
#     doas \
#     python3 \
#     qt6-qtbase \
#     qt6-qtbase-sqlite \
#     tini \
#     tzdata

FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y --no-install-recommends --allow-unauthenticated install \
   build-essential \
   cmake \
   git \
   zip \
   unzip \
   xz-utils \
   wget \
   curl \
   ca-certificates \
   make \
   bash \
   bc \
   gcc-avr \
   binutils-avr \
   avr-libc \
   gdb-avr \
   avrdude

# # Create a custom user with UID 1234 and GID 1234
# RUN groupadd -g 1234 customgroup && \
#     useradd -m -u 1234 -g customgroup customuser
    
# Switch to the custom user
# USER customuser

RUN mkdir /workspace
COPY . /workspace

WORKDIR /workspace
VOLUME /workspace

# # Print the UID and GID
# CMD echo 'Inside Container:' && \
#    echo 'User: $(whoami) UID: $(id -u) GID: $(id -g)' && \
#    ls -la && \
#    ./build-in-docker.sh

# RUN mkdir /workspace
# RUN mkdir /dist

# COPY . /workspace
# WORKDIR /workspace
# VOLUME /dist

CMD [ "bash", "./build-in-docker.sh" ]
