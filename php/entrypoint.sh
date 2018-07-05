#!/usr/bin/env bash

cd /home/workspace/php

function usage() {
    echo "  usage: php <options>"
    echo ""
    echo "         composer             execute composer."
    echo "         date                 show date (format: D M d Y)."
    echo "         gz64     <path>      get b64 gziped file content."
    echo "         serve    <path>      server static en localhost:8080."
    echo "         -v                   show versions."
    exit 1
}

case "$1" in
    composer) $1 "${@:2}" ;;
    date) php -r "echo date('D M d Y' . PHP_EOL);" ;;
    gz64)
        if [ -z $2 ]; then
            echo "  Error : Path argument is required."; exit 1
        elif [ ! -f $2 ]; then
            echo "  Error : File '$2' does not exists"; exit 1
        else
            php -r "echo base64_encode(gzcompress(file_get_contents(\"$2\"), 9));"
        fi
    ;;
    serve)
        [ -z "${@:2}" ] && path=. || path="${@:2}"
        php -S localhost:8888 -t "${path}"
    ;;
    -v)
        echo "PHP : $(php -v)"
        echo "composer : $(composer --version)"
    ;;
    *) php "${@:1}" ;;
esac
