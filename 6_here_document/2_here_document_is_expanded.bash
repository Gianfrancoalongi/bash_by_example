#!/bin/bash
VARIABLE='this is a piece of string'
cat <<EOF
 ${VARIABLE}
 $((1+1))
 $(head -n 2 /etc/passwd)
 ${VARIABLE/piece of/}
EOF