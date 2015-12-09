#!/bin/bash
mkfifo pipe
PORT=50555
bash pipe | nc -l ${PORT} >pipe
rm pipe