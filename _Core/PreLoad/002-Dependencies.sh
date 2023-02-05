#!/usr/bin/env bash
# Base functions - Dependencies

# Include all the files from given directory (Non-Recursive Mode)
# $1 - directory path
includeAll() {
    cd "$SCRIPT_ROOT"
    if [[ ! -d $1 ]]; then
        printError "[include] Not a directory: $1"
        exit $ERROR_DIRECTORY
    else
        includeFiles=$(find "$1"/*.sh)
        for f in $includeFiles; do
            source "$f" || fail "[include] Cannot source: " "$f"
        done
    fi
}

# Include all the files from given directory (Recursive Mode)
# $1 - directory path
includeAllRecursive() {
    cd "$SCRIPT_ROOT"
    if [[ ! -d $1 ]]; then
        printError "[include] Not a directory: $1"
        exit $ERROR_DIRECTORY
    else
        includeFiles=$(find "$1" -name '*.sh')
        for f in $includeFiles; do
            source "$f" || fail "[include] Cannot source: " "$f"
        done
    fi
}

# Include a single file
# $1 - file path
include() {
    cd "$SCRIPT_ROOT"
    if [[ ! -f $1 ]]; then
        printError "[include] Not a file: $1"
        exit $ERROR_FILE
    else
        source $1/*.sh
    fi
}
