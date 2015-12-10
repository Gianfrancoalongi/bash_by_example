#!/bin/bash

delete_all_vowels() { echo $@ | tr -d 'aeiouy' ; }

INPUT="what a wonderful day"
RES=( $(delete_all_vowels ${INPUT}) )
echo ${#RES[*]}
(IFS='|'; echo "${RES[*]}")