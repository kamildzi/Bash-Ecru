#!/usr/bin/env bash
# Functions for common use - SysArgs

# Check if the parameter is given, exit otherwise
# $1 - variable to check on
# $2 - variable name (printed to the user, optional)
checkParam() {
    declare -r PARAM="$1"
    if [[ -z $2 ]]; then
        declare -r PNAME="Parameter"
    else
        declare -r PNAME="$2"
    fi

    if [[ -z $PARAM ]]; then
        printError "$PNAME is needed."
        exit $ERROR_VARIABLE
    fi
}

# Exit if not run as root
# NOTE: sudo should not be accepted
checkRoot() {
    if [ "$EUID" -ne 0 ]; then
        printError "root account is required."
        exit $ERROR_PRIVILEGE
    fi
}
