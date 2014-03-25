#!/bin/bash

tests() 
{
    start_coffee_server
    send 'REGISTER JOHN 11AA11'
    result_equals 'OK'
    is_in_user_db 'JOHN 11AA11'

    start_coffee_server
    send 'REGISTER JOHN 22AA22'
    result_equals 'ALREADY_REGISTERED'
    is_in_user_db 'JOHN 11AA11'
    is_not_in_user_db 'JOHN 22AA22'

    start_coffee_server
    send 'BREW JOHN AA11AA'
    result_equals 'WRONG_PASSWORD'

    start_coffee_server
    send 'BREW JOHN 11AA11'
    result_equals 'BREWING'

    start_coffee_server
    send 'DEREGISTER JOHN AA11AA'
    result_equals 'WRONG_PASSWORD'

    start_coffee_server
    send 'DEREGISTER JOHN 11AA11'
    result_equals 'OK'
    is_not_in_user_db 'JOHN 11AA11'

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

is_not_in_user_db() {
    grep -q "${1}" users.db
    [[ $? != 0 ]] || { echo "ERROR: ${1} is still in users.db"; }
}

is_in_user_db() {
    grep -q "${1}" users.db
    [[ $? == 0 ]] || { echo "ERROR: ${1} is not in users.db"; }
}

tests