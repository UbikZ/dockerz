#!/usr/bin/env bash

cd /home/workspace/ffmpeg

function usage() {
    echo "  usage: ffmpeg <options>"
    echo ""
    echo "         avi-mp4 <input> <output>"
    echo "         flv-mp4 <input> <output>"
    echo "         wmv-mp4 <input> <output>"
    echo "         -v       show versions."
    echo "         -h       show usage."
    exit 1
}

checkInputOutputArgs() {
    if [ -z $1 ]; then
        echo "  Error : Input file argument is required."; exit 1
    elif [ ! -f $1 ]; then
        echo "  Error : Input file ($1) does not exist."; exit 1
    elif [ -z $2 ]; then
        echo "  Error : Output file argument is required."; exit 1
    fi
}

case "$1" in
    avi-mp4)
        checkInputOutputArgs $2 $3
        ffmpeg -i "$2" -c:a aac -b:a 128k -c:v libx264 -crf 23 "$3";
    ;;
    flv-mp4)
        checkInputOutputArgs $2 $3
        ffmpeg -i "$2" -c:v libx264 -preset veryslow -crf 19 -c:a copy "$3";
    ;;
    w2m-mp4)
        checkInputOutputArgs $2 $3
        ffmpeg -i "$2" -c:v libx264 -crf 23 -c:a aac -q:a 100 "$3";
    ;;
    -v)
        echo "ffmpeg : $(ffmpeg -version)"
    ;;
    -h) usage ;;
    *) ffmpeg "${@:1}" ;;
esac
