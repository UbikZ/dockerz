#!/usr/bin/env bash

cd /home/workspace/node

function usage() {
    echo "  usage: node [npm] [yarn]"
    echo ""
    echo "         npm      execute npm."
    echo "         yarn     execute yarn."
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

case "$1" in
    npm) npm ${@:2} ;;
    yarn) yarn ${@:2} ;;
    -v) (
        echo "NodeJS : $(node -v)"
        echo "NPM : $(npm -v)"
        echo "Yarn : $(yarn -v)"
    ) ;;
    -h) usage ;;
    *) node ${@:2} ;;
esac
