#!/usr/bin/env bash
# System codes definition

# General Success Code
declare -rg SUCCESS_CODE='0'

# General Error Code
declare -rg ERROR_CODE='1'

# Internal Error
declare -rg ERROR_INTERNAL='10'
declare -rg ERROR_PRIVILEGE='11'
declare -rg ERROR_VARIABLE='12'

# User
declare -rg ERROR_USER='50'

# Input/Output
declare -rg ERROR_IO='100'

# Filesystem
declare -rg ERROR_FILE='101'
declare -rg ERROR_DIRECTORY='102'
