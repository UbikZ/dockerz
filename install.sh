#!/usr/bin/env bash

readonly bashRc=~/.bashrc
readonly bashDockerFile=.bash_docker.sh

[[ -z $(cat ${bashRc} | grep "${bashDockerFile}") ]] && (echo "[ -f ~/${bashDockerFile} ] && source ~/${bashDockerFile}" >> "${bashRc}")

cat >~/${bashDockerFile} <<EOL
    alias uvi='docker run -ti -v \$(pwd):/home/workspace/vim --rm ubikz/vi'
    alias unode='docker run -ti -v \$(pwd):/home/workspace/node -v ~/.npmrc:/root/.npmrc:ro --rm ubikz/node'
    alias ujava='docker run -ti -v \$(pwd):/home/workspace/java -v ~/.m2:/root/.m2 --rm ubikz/java'
    alias uossl='docker run -ti -v \$(pwd):/home/workspace/openssl --rm ubikz/openssl'
    alias upy='docker run -ti -v \$(pwd):/home/workspace/python --rm ubikz/python'
    alias uphp='docker run -ti -v \$(pwd):/home/workspace/php -p 8888:8888 --rm ubikz/php'
EOL

source ~/${bashDockerFile}
