FROM ubuntu:15.10
MAINTAINER Deepak Prabhakara email: deepak@redsift.io version: 1.1.101

# Install JDK without things like fuse
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jdk maven && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

ENV SIFT_ROOT="/run/dagger/sift" IPC_ROOT="/run/dagger/ipc"
LABEL io.redsift.dagger.init="/usr/bin/redsift/install" io.redsift.dagger.run="/usr/bin/redsift/bootstrap"

COPY src /tmp/sandbox/src
COPY assembly.xml /tmp/sandbox
COPY pom.xml /tmp/sandbox
RUN ls /tmp/sandbox

WORKDIR /tmp/sandbox

RUN mvn install

RUN cp /tmp/sandbox/target/sandbox-java-*-fat.jar /usr/bin/redsift

RUN rm -rf /tmp/sandbox

VOLUME /run/dagger/sift

WORKDIR /run/dagger/sift

ENTRYPOINT ["/bin/bash"]