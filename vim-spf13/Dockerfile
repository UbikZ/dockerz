
FROM alpine:latest
MAINTAINER Gabriel Malet <gabrielmalet@gmail.com>

ENV EXECS   curl git
ENV SPF13   https://j.mp/spf13-vim3
ENV TERM    xterm-256color
ENV SHELL   /bin/bash

# Install base
RUN apk update \
    && apk add --no-cache "${EXECS}" ctags bash git

# Install SPF13
RUN curl "${SPF13}" -L > spf13.sh && sh spf13-vim.sh

# Clean base
RUN apk del "${EXECS}" && rm -rf /var/cache/apk/*

  && curl "${SPF13}" -L > spf13.sh \
  && sh spf13-vim.sh

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
