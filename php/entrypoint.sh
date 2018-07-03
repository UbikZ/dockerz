#!/usr/bin/env bash

cd /home/workspace/php

function usage() {
    echo "  usage: php <options>"
    echo ""
    echo "         composer             execute composer."
    echo "         serve    <path>      server static en localhost:8080."
    echo "         -v                   show versions."
    exit 1
}

case "$1" in
    composer) $1 ${@:2} ;;
    serve) php -S localhost:8888 -t ${@:2} ;;
    -v) (
        echo "PHP : $(php -v)"
        echo "composer : $(composer --version)"
    ) ;;
    *) php ${@:2} ;;
esac
