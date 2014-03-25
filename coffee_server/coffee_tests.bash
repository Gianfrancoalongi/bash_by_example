#!/bin/bash

tests() 
{
    start_coffee_server
    send 'REGISTER JOHN 11AA11'
    result_equals 'OK'

    start_coffee_server
    send 'BREW JOHN AA11AA'
    result_equals 'WRONG_PASSWORD'

    start_coffee_server
    send 'BREW JOHN 11AA11'
    result_equals 'BREWING'

    start_coffee_server
    send 'DEREGISTER JOHN AA11AA'
    result_equals 'WRONG_PASSWORD'

    remove_user_db
}

send() { RES=$(echo ${1} | netcat -i 1 localhost 50556); }

result_equals() {
    [[ ${RES} == ${1} ]] || { echo "ERROR: ${RES} not equal to ${1}" ; }
    echo -n '.'
}

start_coffee_server() {
    bash coffee_server.bash &
    sleep 1
}

remove_user_db() { rm users.db ; }

tests