#!/usr/bin/env bash
# Date related functions

# Update $DATE variable with current system time
updateDate() {
    declare -g DATE=(`date +$DATE_FORMAT`)
}

# Prints current date
printDate() {
    date +$DATE_FORMAT
}
