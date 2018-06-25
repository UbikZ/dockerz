#!/usr/bin/env bash

cd /home/workspace/java

function usage() {
    echo "  usage: ujava [java] [javac] [mvn]"
    echo ""
    echo "         java     execute java."
    echo "         javac    execute javac."
    echo "         mvn      execute mvn."
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

# No param
[ "$1" == "" ] && usage

cmdVersion=0

case "$1" in
    java) java ${@:2} ;;
    javac) javac ${@:2} ;;
    mvn) mvn ${@:2} ;;
    -v) cmdVersion=1 ;;
    -h) usage ;;
    *) usage ;;
esac

[ "${cmdVersion}" -eq 1 ] && (
    echo "Java : $(java -version)"
    echo "Javac : $(javac -version)"
    echo "Maven : $(mvn -version)"
)
