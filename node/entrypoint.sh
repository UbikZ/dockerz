#!/usr/bin/env bash

cd /home/workspace/node

function usage() {
    readonly nodeVersion=$(node -v)
    readonly npmVersion=
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
[ "$1" == "" ] && usage

cmdVersion=0

case "$1" in
    node) node ${@:2} ;;
    npm) npm ${@:2} ;;
    yarn) yarn ${@:2} ;;
    -v) cmdVersion=1 ;;
    -h) usage ;;
    *) usage ;;
esac

[ "${cmdVersion}" -eq 1 ] && (
    echo "NodeJS : $(node -v)"
    echo "NPM : $(npm -v)"
    echo "Yarn : $(yarn -v)"
)
