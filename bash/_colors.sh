#!/bin/bash

# refer: https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt#124408

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m' # Text Reset

function error() {
    color="${txtred}"
    tag='ERROR'

    if [ $# == 2 ]
    then
        print_key_value "${color}" "${tag}" "${1}" "${2}"
    else
        print_value "${color}" "${tag}" "${1}"
    fi
}

function info() {
    color="${txtblu}"
    tag='INFO'

    if [ $# == 2 ]
    then
        print_key_value "${color}" "${tag}" "${1}" "${2}"
    else
        print_value "${color}" "${tag}" "${1}"
    fi
}

function highlight() {
    color="${txtcyn}"
    tag='NOTE'

    if [ $# == 2 ]
    then
        print_key_value "${color}" "${tag}" "${1}" "${2}"
    else
        print_value "${color}" "${tag}" "${1}"
    fi
}

function warning() {
    color="${txtylw}"
    tag='WARNING'

    if [ $# == 2 ]
    then
        print_key_value "${color}" "${tag}" "${1}" "${2}"
    else
        print_value "${color}" "${tag}" "${1}"
    fi
}

function success() {
    color="${txtgrn}"
    tag='SUCCESS'

    if [ $# == 2 ]
    then
        print_key_value "${color}" "${tag}" "${1}" "${2}"
    else
        print_value "${color}" "${tag}" "${1}"
    fi
}

function debug() {
    color="${txtpur}"
    tag='DEBUG'

    if [ $# == 2 ]
    then
        print_key_value "${color}" "${tag}" "${1}" "${2}"
    else
        print_value "${color}" "${tag}" "${1}"
    fi
}

function read_input() {
    color="${txtblu}"
    tag=`printf "%9s" '[INPUT]'`
    question="${1}"

    if [ $# == 2 ]
    then
        default="(${color}${2}${NC})"
        echo -ne "${color}${BOLD}${tag}${NC} ${question} ${default}: ${color}${BOLD}"
    else
        echo -ne "${color}${BOLD}${tag}${NC} ${question}: ${color}${BOLD}"
    fi
    read -p "" answer

    if [ $# == 2 ]
    then
        answer=${answer:-${2}}
    fi

    echo -ne "${NC}"
}

function print_key_value() {
    color="${1}"
    tag=`printf "%9s" "[${2}]"`
    key="${3}"
    value="${4}"

    echo -e "${color}${BOLD}${tag}${color} ${key}: ${BOLD}${value}${NC}"
}

function print_value() {
    color="${1}"
    tag=`printf "%9s" "[${2}]"`
    value="${3}"
    echo -e "${color}${BOLD}${tag}${color} ${value}${NC}"
}