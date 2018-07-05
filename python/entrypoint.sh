#!/usr/bin/env bash

cd /home/workspace/python

function usage() {
    echo "  usage: py <options>"
    echo ""
    echo "         pip  execute pip."
    echo "         -v   show versions."
    echo "         -h   show usage."
    exit 1
}

case "$1" in
    pip) pip "${@:2}" ;;
    -v) (
        echo "Python : $(python --version)"
        echo "Pip : $(pip --version)"
    ) ;;
    -h) usage ;;
    *) python "${@:2}" ;;
esac
