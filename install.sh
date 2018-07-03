#!/usr/bin/env bash

[ -z $1 ] && shrc=${shrc:="${HOME}/.bashrc"} || shrc=$1
bashDockerFile=.bash_docker.sh

[[ -z $(cat ${shrc} | grep "${bashDockerFile}") ]] && (echo "[ -f ~/${bashDockerFile} ] && source ~/${bashDockerFile}" >> "${shrc}")

cat >~/${bashDockerFile} <<EOL
    alias dpull='for img in "vi" "java" "openssl" "python" "php"; do docker pull ubikz/\${img}; done'

    alias uvi='docker run -ti -v \$(pwd):/home/workspace/vim --rm ubikz/vi'

    alias node='docker run -ti -v \$(pwd):/home/workspace/node -v ~/.npmrc:/root/.npmrc:ro --rm ubikz/node'
    alias npm='node npm'
    alias yarn='node yarn'

    alias java='docker run -ti -v \$(pwd):/home/workspace/java -v ~/.m2:/root/.m2 --rm ubikz/java'
    alias javac='java javac'
    alias mvn='java mvn'

    alias ossl='docker run -ti -v \$(pwd):/home/workspace/openssl --rm ubikz/openssl'

    alias py='docker run -ti -v \$(pwd):/home/workspace/python --rm ubikz/python'
    alias python='py'
    alias pip='py pip'

    alias php='docker run -ti -v \$(pwd):/home/workspace/php -p 8888:8888 --rm ubikz/php'
    alias composer='php composer'
EOL
