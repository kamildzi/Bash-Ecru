#!/usr/bin/env bash
# Develop-Tools module

includeAllRecursive _dev

checkParam "$1" "Command"
COMMAND=$1
shift

case $COMMAND in

    # prepare new (archived) package
    "build" )
        buildPkg "$@"
        ;;

    "init" )
        initApp "$1"
        ;;

    "rm")
        rmApp "$1"
        ;;

    *)
        printError "Wrong command"
        ;;
esac
