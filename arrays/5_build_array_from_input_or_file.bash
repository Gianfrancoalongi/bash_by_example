#!/bin/bash

print_array_info() {
    echo '--------------------------------'
    echo Array contains: ${ARRAY[*]}
    echo Array is of length: ${#ARRAY[*]}
    echo Element 2 is: ${ARRAY[2]}
}

ARRAY=( $(head -n 10 /etc/passwd) )
print_array_info

ARRAY=( $(echo hello world how are you) )
print_array_info