#!/usr/bin/env bash
# Base Functions

# Build new package
# Might be usefull for deployments ;) 
buildPkg() {
    declare FilePath="../$BUILD_PKG_NAME-$DATE.tar.gz"
    if [[ -f "$FilePath" ]]; then
        printError "File already exists:" "$FilePath"
        exit $ERROR_FILE
    fi

    printInfo "Preparing the archive, please wait"
    tar -czpf "$FilePath" ./
    checkLastOp
    printSuccess "File saved at: \n$FilePath"
}

# Init new App
# $1 - App Name
initApp() {
    checkParam "$1" "ModuleName"
    declare ModuleName=$1

    # Check ModuleName
    case "$ModuleName" in
        *\ *)
            printError "Spaces not allowed!"
            exit $ERROR_CODE
            ;;
        *)
            printInfo "Initializing $ModuleName"

            printText "... Creating directory"
            mkdir "./_$ModuleName"; checkLastOp


            printText "... Initializing base filesystem"

            echo $BASE_HEADER    | base64 -d >  "./_$ModuleName/000-Config.sh"; checkLastOp
            echo $CONFIG_CONTENT | base64 -d >> "./_$ModuleName/000-Config.sh"; checkLastOp

            echo $BASE_HEADER        | base64 -d >  "./_$ModuleName/Base.sh"; checkLastOp
            echo $BASEMODULE_CONTENT | base64 -d >> "./_$ModuleName/Base.sh"; checkLastOp


            printText "... Creating runner file"

            echo $BASE_HEADER        | base64 -d >  "./$ModuleName.sh"; checkLastOp
            echo $MAINMODULE_CONTENT | base64 -d >> "./$ModuleName.sh"; checkLastOp


            printSuccess "Done"
            ;;
    esac
}

# Remove the App
# $1 - App Name
rmApp() {
    checkParam "$1" "ModuleName"
    declare ModuleName=$1

    RunFile="./$ModuleName.sh"
    ModuleDir="./_$ModuleName"

    if [[ ! -f "$RunFile" ]] || [[ ! -d "$ModuleDir" ]]; then
        printError "Module not found: $ModuleName"
    fi

    printWarning "You are about to remove module: $ModuleName"
    askContinue

    printNotice "Removing the files ..."
    rm  "$RunFile"   ; checkLastOp
    rm -rf "$ModuleDir" ; checkLastOp
    printSuccess "Done"
}
