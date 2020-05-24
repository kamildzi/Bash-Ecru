#!/usr/bin/env bash
# Base functions - System Operations

# Print error message and exit
# $1, $2, ... - message text 
fail() {
    printError "$@"
    exit $ERROR_CODE
}
