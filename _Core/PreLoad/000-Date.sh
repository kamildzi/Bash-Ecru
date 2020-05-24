#!/usr/bin/env bash
# Base variables, for common use

# General Date Format
# DATE_FORMAT='%H-%M_%d-%m-%Y'
DATE_FORMAT='%Y-%m-%d__%H-%M'

# Script start date. 
# NOTE: This should not be changed later.
START_DATE=(`date +$DATE_FORMAT`)

# Current date
# NOTE: this can be updated with updateDate() function
DATE=(`date +$DATE_FORMAT`)
