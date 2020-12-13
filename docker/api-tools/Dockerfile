FROM debian:buster-slim

ENV GITHUB_MIRROR_URL "https://github.com"
ENV NODEJS_MIRROR_URL "https://nodejs.org/dist"

ARG ENVAL_VERSION=0.1.0
ARG JAVA_VERSION=11.0.9+1-1~deb10u2
ARG NODEJS_VERSION=12.18.0
ARG OPENAPI_GENERATOR_CLI_VERSION=cli-4.3.1
ARG SWAGGER_CLI_VERSION=4.0.3

RUN mkdir -p /usr/share/man/man1 /usr/share/man/man2 && \
    apt-get update && \
    apt-get install -y xz-utils wget curl zip unzip openjdk-11-jre-headless python3 && \
    rm -rf /var/lib/apt/lists/*

RUN curl ${GITHUB_MIRROR_URL}/Adhara-Tech/enval/releases/download/v${ENVAL_VERSION}/enval_linux_amd64 -L -o /usr/local/bin/enval && \
    chmod +x /usr/local/bin/enval

RUN wget ${NODEJS_MIRROR_URL}/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.xz && \
    mkdir -p /usr/local/lib/nodejs && \
    tar -xJvf node-v${NODEJS_VERSION}-linux-x64.tar.xz -C /usr/local/lib/nodejs

ENV PATH="${PATH}:/usr/local/lib/nodejs/node-v${NODEJS_VERSION}-linux-x64/bin"


RUN groupadd --gid 1000 surfers && \
  useradd --uid 1000 --gid surfers --shell /bin/bash --create-home surfers

USER surfers

# Ensure that the HOME variable is set in Docker
ENV HOME /home/surfers
ENV PATH="${PATH}:${HOME}/.npm-packages/bin"


RUN  mkdir "${HOME}/.npm-packages" && \
    npm config set prefix "${HOME}/.npm-packages" && \
    npm install -g -g --no-package-lock \
    @openapitools/openapi-generator-cli@${OPENAPI_GENERATOR_CLI_VERSION} \
    swagger-cli@${SWAGGER_CLI_VERSION} 

WORKDIR /home/surfers