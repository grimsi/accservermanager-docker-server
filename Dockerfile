# Build on Apple Silicon chips: docker buildx build --platform=linux/x86_64
FROM ubuntu:latest

RUN apt update \
    && dpkg --add-architecture i386 \
    && DEBIAN_FRONTEND=noninteractive apt install -y wine-stable \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ENV WINEARCH=win64

RUN winecfg

VOLUME /opt/server
WORKDIR /opt/server

CMD ["wine", "accServer.exe"]
