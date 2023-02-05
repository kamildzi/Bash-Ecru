#!/usr/bin/env bash
# Modules runner script

# Stop on failure
set -e

# uncomment for DEBUG
#set -x

# Set Internal Field Separator
IFS=$'\n'

# Init _Core 
declare -rg PRELOAD_DIR="$( dirname "${BASH_SOURCE[0]}" )/_Core/PreLoad"
if [[ ! -d "$PRELOAD_DIR" ]]; then
    echo "No files to source at: $PRELOAD_DIR"
    exit 255
else
    for f in "$PRELOAD_DIR"/*.sh; do
        source $f || ( echo "Cannot source: $f" && exit 255 )
    done
fi

# Include the Framework
includeAllRecursive _Core/Framework

# Check the param
cd "$SCRIPT_ROOT"
checkParam "$1" "Module name"
if [[ -f "$1"  ]]; then
    declare -rg MODULE_FILE="$1"
elif [[ -f "$1.sh" ]]; then
    declare -rg MODULE_FILE="$1.sh"
else
    echo "$1 not found!"
    exit $ERROR_FILE
fi

# Set real module name
declare -rg MODULE_NAME=${MODULE_FILE::-3}

# Run the module
shift
. ./"$MODULE_FILE"
