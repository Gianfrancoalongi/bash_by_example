#!/bin/bash
mkfifo pipe
PORT=50555
{ read LINE; echo ${LINE}; } <pipe | nc -l ${PORT} >pipe
rm pipe