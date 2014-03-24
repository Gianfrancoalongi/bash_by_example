#!/bin/bash
mkfifo inpipe outpipe
PORT=50555
(
    read LINE
    echo ${LINE} | rev
    exit 0
) <inpipe >outpipe &
nc -l ${PORT} >inpipe <outpipe
rm inpipe outpipe