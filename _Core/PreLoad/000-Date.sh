#!/usr/bin/env bash
# Base variables, for common use

# General Date Format
# DATE_FORMAT='%H-%M_%d-%m-%Y'
declare -g DATE_FORMAT='%Y-%m-%d__%H-%M'

# Script start date. 
# NOTE: This should not be changed later.
declare -rg START_DATE=(`date +$DATE_FORMAT`)

# Current date
# NOTE: this can be updated with updateDate() function
declare -g DATE=(`date +$DATE_FORMAT`)
