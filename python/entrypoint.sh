#!/usr/bin/env bash

cd /home/workspace/python

function usage() {
    echo "  usage: upy [python] [pip]"
    echo ""
    echo "         py   execute python."
    echo "         pip  execute pip."
    echo "         -v   show versions."
    echo "         -h   show usage."
    exit 1
}

# No param
[ -z "$1" ] && usage

cmdVersion=0

case "$1" in
    python) python ${@:2} ;;
    pip) pip ${@:2} ;;
    -v) cmdVersion=1 ;;
    -h) usage ;;
    *) usage ;;
esac

[ "${cmdVersion}" -eq 1 ] && (
    echo "Python : $(python --version)"
    echo "Pip : $(pip --version)"
)
