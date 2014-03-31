#!/bin/bash
echo 'hello_world' |  { VAR=1; read LINE; printf "LINE=%s\nVAR=%s\n" ${LINE} ${VAR}; }