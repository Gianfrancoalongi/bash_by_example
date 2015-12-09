#!/bin/bash

sum() { S=0;for N in $@;do S=$((${S}+${N}));done;echo ${S} ; }
mult() { S=1;for N in $@;do S=$((${S}*${N}));done;echo ${S} ; }
reverse() { echo $@ | rev ; }


FUNCTIONS=( sum mult reverse mult sum )
INPUT='1 2 3 4 5 6 7 8 9 10'
for FUN in ${FUNCTIONS[*]}
do
    ${FUN} ${INPUT}
done