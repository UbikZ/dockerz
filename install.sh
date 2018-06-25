#!/usr/bin/env bash

readonly bashRc=~/.bashrc
readonly bashDockerFile=.bash_docker.sh

[[ -z $(cat ${bashRc} | grep "${bashDockerFile}") ]] && (echo "[ -f ~/${bashDockerFile} ] && source ~/${bashDockerFile}" >> "${bashRc}")

cat >~/${bashDockerFile} <<EOL
    alias uvi='docker run -ti -v $(pwd):/home/workspace/vim --rm ubikz/vim'
    alias unode='docker run -ti -v $(pwd):/home/workspace/node -v ~/.npmrc:/root/.npmrc --rm ubikz/node'
EOL

source ~/${bashDockerFile}
