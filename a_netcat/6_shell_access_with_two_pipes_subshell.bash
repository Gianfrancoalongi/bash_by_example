#!/bin/bash
mkfifo inpipe outpipe
PORT=50555
(
    read CMD
    ${CMD}
) <inpipe >outpipe &
nc -l ${PORT} >inpipe <outpipe
rm inpipe outpipe