#!/bin/bash
mkfifo pipe
PORT=50555
(
    read LINE <pipe
    echo ${LINE} >pipe
    exit 0
) &
nc -l ${PORT} >pipe <pipe
rm pipe