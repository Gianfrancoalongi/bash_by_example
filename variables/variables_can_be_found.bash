#!/bin/bash

AUTOMATIC_USERS="zenon coderunner mcintyre"
AUTOMATIC_SYSTEMS="dpop zmyg"
MANUAL_USERS="xort trynd john elize"
MANUAL_SYSTEMS="kvord titic polly trix"

echo "AUTOMATIC stuff: ${!AUTOMATIC*}"
for VAR in ${!AUTOMATIC*}
do
    eval "echo '${VAR}='\$${VAR}"
done

echo "MANUAL stuff: ${!MANUAL*}"
for VAR in ${!MANUAL*}
do
    eval "echo '${VAR}='\$${VAR}"
done