FROM node:12-alpine

LABEL maintainer="Rodrigo de Souza <rsouza01@gmail.com>"
LABEL build_date="2020-12-10"


RUN apk add --no-cache \
  python \
  py-pip \
  py-setuptools \
  ca-certificates \
  groff \
  less \
  bash && \
  pip install --no-cache-dir --upgrade pip awscli

ENV NODE_ENV development

RUN npm install -g npm@latest \
  && npm install -g serverless@2.15.0

ENTRYPOINT ["/bin/bash", "-c"]