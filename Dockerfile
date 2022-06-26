# syntax=docker/dockerfile:1
FROM alpine:latest AS builder
RUN apk --no-cache add build-base
RUN apk add cmake git
RUN apk add bash bash-doc bash-completion
RUN apk add util-linux pciutils usbutils coreutils binutils findutils grep iproute2

FROM builder AS build1
WORKDIR /app
COPY source.cpp source.cpp
RUN g++ -o ./binary source.cpp

ENTRYPOINT [ "/bin/bash" ]