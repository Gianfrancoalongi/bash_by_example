#!/bin/bash
print_array() {
    echo ${ARRAY[*]}
}
ARRAY=(elem1 elem2 elem3 elem4)
print_array
ARRAY=([3]=elem1 [2]=elem2 [1]=elem3 [0]=elem4)
print_array