#!/bin/bash
mkfifo nums factors

start_number_generator() {
    ( for((x=1;x<10;x++)) {
        echo ${x} >nums
	sleep 1
      }
      echo 'done' >nums
    ) &
}

start_factorizer() {
    ( while true
      do
	read NUMBER <nums
	[[ ${NUMBER} == 'done' ]] && { echo 'done' >factors && exit 0 ; }
	RES=""
        for((i=1;i<=${NUMBER};i++)) {
	    [[ $(( ${NUMBER} % ${i} )) -eq 0 ]] && RES="${RES} ${i}"
	} 
	echo "${NUMBER}:${RES}" >factors
      done
     ) &
}

start_reporter() {
    while true
    do
        read FACTORS <factors
	[[ ${FACTORS} == 'done' ]] && break
        echo ${FACTORS}
    done
}

start_number_generator
start_factorizer
start_reporter

rm nums factors