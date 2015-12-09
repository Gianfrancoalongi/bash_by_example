#!/bin/bash

sum_numbers() {
    SUM=0
    for NUM in $@
    do
	SUM=$((${SUM}+${NUM}))
    done
    echo ${SUM}
}

sum_numbers 1 2 3 4