#!/bin/bash

main() 
{
    get_command
    handle_command
    send_reply
}

get_command() { 
    read INPUT
    COMMAND=$(echo ${INPUT} | cut -d ' ' -f 1)
    REST=$(echo ${INPUT} | cut -d ' ' -f 1 --complement)
}

handle_command() {
    case ${COMMAND} in
	REGISTER)
	    handle_register_command
	    ;;
	BREW)
	    handle_brew_command	    
	    ;;
	TAKE_BREWED)
	    handle_take_brewed_command
	    ;;
	DEREGISTER)
	    handle_deregister_command
	    ;;
    esac
}

handle_register_command() {
    USER=$(echo ${REST} | cut -d ' ' -f 1)
    PASS=$(echo ${REST} | cut -d ' ' -f 2)
    grep -q "^${USER}" users.db &> /dev/null
    if [[ $? == 0 ]]
    then
	REPLY='ALREADY_REGISTERED'
    else
	echo ${REST} >> users.db
	REPLY='OK'
    fi
}

handle_brew_command() {
    grep -q "${REST}" users.db
    if [[ $? != 0 ]]
    then
	REPLY='WRONG_PASSWORD'
    else
	echo ${REST} >> brewed.db
	REPLY='BREWING'	
    fi
}

handle_deregister_command() {
    grep -q "${REST}" users.db
    if [[ $? != 0 ]]
    then 
	REPLY='WRONG_PASSWORD'
    else
	sed -i "/${REST}/d" users.db
	REPLY='OK'
    fi
}

handle_take_brewed_command() {
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