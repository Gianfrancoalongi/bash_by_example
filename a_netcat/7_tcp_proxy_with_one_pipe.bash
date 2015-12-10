#!/bin/bash
mkfifo pipe
PORT=8080
nc -l ${PORT} <pipe | netcat google.com 80 >pipe
rm pipe