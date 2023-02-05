#!/usr/bin/env bash
# Base variables, for common use

# Framework Version
declare -rg FRAMEWORK_VER='0.82'

# Project Root Path
declare -rg SCRIPT_ROOT=$( readlink -f $( dirname "${BASH_SOURCE[0]}" )/../.. )
