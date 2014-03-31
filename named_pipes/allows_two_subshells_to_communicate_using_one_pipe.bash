#!/bin/bash
mkfifo input

(
    read LINE
    echo ${LINE} | rev >input
) <input &

echo 'hello world, how are you?' >input
read LINE <input
echo "got reply: ${LINE}"

rm input