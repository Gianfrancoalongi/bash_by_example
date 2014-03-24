#!/bin/bash
mkfifo pipe
PORT=50555
(
    read LINE <pipe
    echo ${LINE} >pipe
) &
nc -l ${PORT} >pipe <pipe
rm pipe