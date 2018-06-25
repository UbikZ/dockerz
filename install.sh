#!/usr/bin/env bash

readonly bashRc=~/.bashrc
readonly bashDockerFile=.bash_docker.sh

[[ -z $(cat ${bashRc} | grep "${bashDockerFile}") ]] && (echo "[ -f ~/${bashDockerFile} ] && source ~/${bashDockerFile}" >> "${bashRc}")

cat >~/${bashDockerFile} <<EOL
    alias uvi='docker run -ti -v $(pwd):/home/workspace/vim --rm ubikz/vim'
    alias unode='docker run -ti -v $(pwd):/home/workspace/node -v ~/.npmrc:/root/.npmrc:ro --rm ubikz/node --rm'
    alias ujava='docker run -ti -v $(pwd):/home/workspace/java -v ~/.m2:/root/.m2:ro --rm ubikz/node --rm'
EOL

source ~/${bashDockerFile}
