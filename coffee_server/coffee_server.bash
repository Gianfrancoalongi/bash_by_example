#!/bin/bash
PORT=50556
mkfifo pipe
./server.bash <pipe |  nc -l ${PORT} >pipe
rm pipe