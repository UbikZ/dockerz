#!/usr/bin/env bash

cd /home/workspace/node

function usage() {
    echo "  usage: unode [node] [npm] [yarn]"
    echo ""
    echo "         node     execute node."
    echo "         npm      execute npm."
    echo "         yarn     execute yarn."
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

# No param
[ -z "$1" ] && usage

case "$1" in
    node) node ${@:2} ;;
    npm) npm ${@:2} ;;
    yarn) yarn ${@:2} ;;
    -v) (
        echo "NodeJS : $(node -v)"
        echo "NPM : $(npm -v)"
        echo "Yarn : $(yarn -v)"
    ) ;;
    -h) usage ;;
    *) usage ;;
esac
