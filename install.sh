#!/usr/bin/env bash

bashDockerFile=.bash_docker.sh

cmdBuild=0
cmdShFile=${HOME}/.zshrc

while [ ! -z $1 ]; do
    case "$1" in
        -b|--build) cmdBuild=1 ;;
        -s|--shfile) cmdShFile=$2; shift; ;;
    esac
    shift
done


[[ -z $(cat ${cmdShFile} | grep "${bashDockerFile}") ]] && (echo "[ -f ~/${bashDockerFile} ] && source ~/${bashDockerFile}" >> "${cmdShFile}")

echo "Create reference of ${bashDockerFile} within ${cmdShFile}"

onEachPkgs() {
    local pkgs=(
        'vi' \
        'ffmpeg' \
        'node=-v ~/.npmrc:/root/.npmrc:ro' \
        'java=-v ~/.m2:/root/.m2' \
        'openssl' \
        'python' \
        'php=-p 8888:8888'
    )

    for (( i = 0; i < ${#pkgs[@]}; i++ )); do
        $1 "${pkgs[$i]}"
    done
}

addEntryInBashDockerFile() {
    echo $1 | awk -F'=' '{print "    function " $1 " { docker run -ti --rm -v $(pwd):/home/workspace/" $1 " " $2 " ubikz/" $1 " $@; }"}' >> ~/${bashDockerFile}
}

dockerBuild() {
    local pkg=$(echo $1 | awk -F'=' '{print $1}')
    echo "Building image : ${pkg}."
    docker build ./${pkg} -t ubikz/${pkg} 1>/dev/null
}


> ~/${bashDockerFile}

onEachPkgs addEntryInBashDockerFile

cat >>~/${bashDockerFile} <<EOL
    function docker-rmi { docker images -aq -f "dangling=true" | xargs docker rmi; }
    function docker-rm { docker ps -aq | xargs docker rm -f; }
    function docker-ssh { docker exec -ti \$1 /bin/sh; }
    function dpull { for img in "vi" "java" "openssl" "python" "php"; do docker pull ubikz/\${img} 1>/dev/null; done; }
    function npm { node npm; }
    function yarn { node yarn; }
    function rollup { node rollup; }
    function webpack-cli { node webpack-cli; };
    function javac { java javac; }
    function mvn { java mvn; }
    function python { py; }
    function pip { py pip; }
    function composer { php composer; }
EOL

if [ ${cmdBuild} -eq 1 ]; then
    source ~/${bashDockerFile}

    onEachPkgs dockerBuild
    echo "Clean residual images."
    docker-rmi 1>/dev/null
    echo "Done."
fi
