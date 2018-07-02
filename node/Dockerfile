FROM node:alpine
MAINTAINER Gabriel Malet <gabrielmalet@gmail.com>

ENV SHELL       /bin/bash
ENV UHOME       /home/workspace

# Install
RUN apk --no-cache add bash \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /usr/local/bin/

RUN mkdir -p ${UHOME}/node

WORKDIR ${UHOME}

ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
