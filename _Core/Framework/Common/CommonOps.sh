#!/usr/bin/env bash
# Functions for common use - General Operations

# Check last operation result. 
# Exit on failure
checkLastOp() {
    if [[ $? != 0 ]]; then
        printError " ... FAILED!"
        exit $ERROR_CODE
    else
        printSuccess " ... OK"
    fi
}

# Ask whether shall we continue
askContinue() {
    printText "\nContinue? [Y/n] "
    read ans
    if [[ $ans != 'Y' ]]; then
        printNotice "Aborted by user"
        exit $ERROR_USER
    fi
}
