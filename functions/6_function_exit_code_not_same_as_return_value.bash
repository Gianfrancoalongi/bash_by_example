#!/bin/bash

function_returns_reversal_exits_with_2() 
{
    echo $@ | rev
    exit 2
}

INPUT="hello world how are you?"
RES=$(function_returns_reversal_exits_with_2 ${INPUT})
echo exit code was: $?
echo returned result was: ${RES}