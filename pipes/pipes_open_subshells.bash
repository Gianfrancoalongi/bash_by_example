#!/bin/bash
VAR=0
info() {
    printf "VAR=%i BASH_SUBSHELL:%s\n" ${VAR} ${BASH_SUBSHELL} >&2
    VAR=$((VAR+1))
}

info
echo '-------------------------------------------------------------------------------'
info | info | info
echo '-------------------------------------------------------------------------------'
info
info