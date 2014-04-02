#!/bin/bash

start_listening_tcp_server() 
{
    mkfifo pipe
    {   read INPUT
	echo tcp server received: ${INPUT} >&2 
	rm pipe
    } <pipe | nc -l 50555 >pipe &
}

start_listening_tcp_server
sleep 1
echo 'hello world' > /dev/tcp/localhost/50555