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
	    echo ${REST} >> users.db
	    REPLY='OK'
	    ;;
	BREW)
	    grep -q "${REST}" users.db
	    if [[ $? != 0 ]]
	    then
		REPLY='WRONG_PASSWORD'
	    fi
	    ;;
    esac
}

send_reply() { echo ${REPLY} ; }

main