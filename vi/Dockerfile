FROM alpine:latest
MAINTAINER Gabriel Malet <gabrielmalet@gmail.com>

ENV TUVC        https://github.com/amix/vimrc.git
ENV TERM        xterm-256color
ENV SHELL       /bin/bash
ENV VRUNTIME    /root/.vim_runtime
ENV UHOME       /home/workspace

# Install
RUN apk --no-cache add \
    git \
    vim \
    curl \
    python \
    ctags \
    && git clone --depth=1 ${TUVC} ${VRUNTIME} \
    && sh ${VRUNTIME}/install_awesome_vimrc.sh \
    && apk del curl

# YouCompleteMe
RUN apk add cmake \
    python-dev \
    && git clone --depth 1  https://github.com/Valloric/YouCompleteMe ${VRUNTIME}/YouCompleteMe/ \
    && cd ${VRUNTIME}/YouCompleteMe \
    && git submodule update --init --recursive \
    && ${VRUNTIME}/YouCompleteMe/install.py --gocode-completer

# Plugins
RUN cd ${VRUNTIME} \
    && git clone --depth 1 https://github.com/pangloss/vim-javascript &

# Cleanup
RUN apk del build-deps \
    && apk add \
    libxt \
    libx11 \
    libstdc++ \
    && rm -rf \
    ${VRUNTIME}/YouCompleteMe/third_party/ycmd/clang_includes \
    ${VRUNTIME}/YouCompleteMe/third_party/ycmd/cpp \
    /usr/lib/go \
    /var/cache/* \
    /var/log/* \
    /var/tmp/* \
    && mkdir /var/cache/apk

COPY my_configs.vim ${VRUNTIME}
COPY entrypoint.sh /usr/local/bin/

RUN mkdir -p ${UHOME}/vim

WORKDIR ${UHOME}

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
