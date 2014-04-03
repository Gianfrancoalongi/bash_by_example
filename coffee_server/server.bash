#!/bin/bash

main() 
{
    while :
    do
	get_command
	handle_command
	send_reply
    done
}

get_command() { 
    read INPUT
    COMMAND=$(echo ${INPUT} | cut -d ' ' -f 1)
    REST=$(echo ${INPUT} | cut -d ' ' -f 1 --complement)
}

handle_command() {
    case ${COMMAND} in
	REGISTER)
	    handle_register
	    ;;
	BREW)
	    handle_brew	    
	    ;;
	TAKE_BREWED)
	    handle_take_brewed
	    ;;
	DEREGISTER)
	    handle_deregister
	    ;;
    esac
}

handle_register() {
    USER=$(echo ${REST} | cut -d ' ' -f 1)
    grep -q "^${USER}" users.db &> /dev/null
    if [[ $? == 0 ]]
    then
	REPLY='ALREADY_REGISTERED'
    else
	echo ${REST} >> users.db
	REPLY='OK'
    fi
}

handle_brew() {
    grep -q "${REST}" users.db
    if [[ $? != 0 ]]
    then
	REPLY='WRONG_PASSWORD'
    else
	grep -q "${REST}" brewed.db &> /dev/null
	if [[ $? == 0 ]]
	then
	    REPLY='ALREADY_BREWED'
	else
	    echo ${REST} >> brewed.db
	    REPLY='BREWING'
	fi
    fi
}

handle_deregister() {
    grep -q "${REST}" users.db
    if [[ $? != 0 ]]
    then 
	REPLY='WRONG_PASSWORD'
    else
	sed -i "/${REST}/d" users.db
	REPLY='OK'
    fi
}

handle_take_brewed() {
    grep -q "${REST}" users.db
    if [[ $? != 0 ]]
    then
	REPLY='WRONG_PASSWORD'
    else
	grep -q "${REST}" brewed.db &> /dev/null
	if [[ $? != 0 ]]
	then
	    REPLY='NOTHING_BREWED'
	else
	    sed -i "/${REST}/d" brewed.db
	    REPLY='COFFEE_REMOVED'
	fi
    fi
}

send_reply() { echo ${REPLY} ; }

main