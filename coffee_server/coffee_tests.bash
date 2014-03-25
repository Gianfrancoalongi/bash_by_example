#!/bin/bash

tests() 
{
    start_coffee_server

    send 'REGISTER JOHN 11AA11'
    result_equals 'OK'

}

send() { RES=$(echo $1 | netcat -i 1 localhost 50556) ; }

result_equals() {
    [[ ${RES} == ${1} ]] || { echo "ERROR: ${RES} not equal to ${1}" && exit 2 ; }
    echo -n '.'
}

start_coffee_server() {
    bash coffee_server.bash &
    sleep 1
}

tests