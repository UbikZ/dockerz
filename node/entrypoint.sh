#!/usr/bin/env bash

cd /home/workspace/node

function usage() {
    echo "  usage: node <options>"
    echo ""
    echo "         npm          execute npm."
    echo "         yarn         execute yarn."
    echo "         eslint       execute eslint."
    echo "         rollup       execute rollup."
    echo "         webpack-cli  execute webpack-cli."
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

case "$1" in
    npm|yarn|rollup|webpack-cli) $1 "${@:2}" ;;
    -v)
        echo "NodeJS : $(node -v)"
        echo "NPM : $(npm -v)"
        echo "Yarn : $(yarn -v)"
        echo "Eslint : $(eslint -v)"
        echo "Rollup : $(rollup -v)"
        echo "Webpack : $(webpack-cli -v)"

    ;;
    -h) usage ;;
    *) node "${@:1}" ;;
esac
