#!/bin/bash
mkfifo input

(
read LINE
echo ${LINE} | rev
) <input &

echo 'hello world, how are you?' >input


rm input