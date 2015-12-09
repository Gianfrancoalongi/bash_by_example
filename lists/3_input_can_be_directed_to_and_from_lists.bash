#!/bin/bash

print_description_of_those_with_real_shells_and_count_fake_shells() {
    ( 
	I=0;
	while read LINE
	do
	    echo ${LINE} | grep -q '/bin/false'
	    if [[ $? -eq 0 ]]
	    then
		    I=$((${I}+1))
	    else
		    echo ${LINE} | awk -F: '{print $5}'
	    fi
	    I=$((${I} + 1))
	done
	echo "Fake shells: ${I}"
     )</etc/passwd >result
}

print_description_of_those_with_real_shells_and_count_fake_shells
cat result && rm result
