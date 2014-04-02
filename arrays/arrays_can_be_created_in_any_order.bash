#!/bin/bash
MY_ARRAY[2]=elem_3
MY_ARRAY[0]=elem_1
MY_ARRAY[1]=elem_2
for((i=0;i<${#MY_ARRAY[*]};i++))
do
    echo "\$\{MY_ARRAY[${i}]\}=${MY_ARRAY[${i}]}"
done