#!/bin/bash

start_reversal_tcp_server() 
{
    mkfifo pipe
    {   read INPUT
	echo ${INPUT} | rev
    } <pipe | nc -l 50555 >pipe &
}

start_reversal_tcp_server
sleep 1

exec 3<> /dev/tcp/localhost/50555

echo 'hello world how are you?' >&3
cat <&3


