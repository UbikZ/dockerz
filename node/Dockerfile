FROM node:alpine
MAINTAINER Gabriel Malet <gabrielmalet@gmail.com>

ENV SHELL       /bin/bash
ENV UHOME       /home/workspace

# Install
RUN apk --no-cache add bash

COPY entrypoint.sh /usr/local/bin/

RUN mkdir -p ${UHOME}/vim

WORKDIR ${UHOME}

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
