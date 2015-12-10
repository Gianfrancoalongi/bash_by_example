#!/bin/bash
ARRAY=(elem1 elem2 elem3 elem4)
( IFS='<' ; echo unquoted expansion: ${ARRAY[*]} )
( IFS='<' ; echo quoted expansion: "${ARRAY[*]}")

ARRAY=( "elem 1" "elem 2" "elem 3" "elem 4")
echo Double quoted @ expansion
printf "%s\n" "${ARRAY[@]}"
echo Unquoted @ expansion
printf "%s\n" ${ARRAY[@]}

