#!/usr/bin/env bash

cd /home/workspace/ffmpeg

function usage() {
    echo "  usage: convert <options>"
    echo ""
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

case "$1" in
    -v) (
        echo "imageMagick : $(convert -version)"
    ) ;;
    -h) usage ;;
    *) convert "${@:1}" ;;
esac
