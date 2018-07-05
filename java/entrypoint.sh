#!/usr/bin/env bash

cd /home/workspace/java

function usage() {
    echo "  usage: java <options>"
    echo ""
    echo "         javac    execute javac."
    echo "         mvn      execute mvn."
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

case "$1" in
    java|javac|mvn) $1 "${@:2}" ;;
    -v)
        echo "Java : $(java -version)"
        echo "Javac : $(javac -version)"
        echo "Maven : $(mvn -version)"
    ;;
    -h) usage ;;
    *) java "${@:1}" ;;
esac
