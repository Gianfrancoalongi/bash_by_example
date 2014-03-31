#!/bin/bash
mkfifo input output

(
    read LINE
    echo ${LINE} | rev >output
) <input &

echo 'hello world, how are you?' >input
read LINE <output
echo "got reply: ${LINE}"

rm input output