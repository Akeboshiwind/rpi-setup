#!/usr/bin/env bash


# >> Utils

log() {
    # Source: https://github.com/kisslinux/kiss/blob/master/kiss#L16
    # Print a message prettily.
    #
    # All messages are printed to stderr to allow the user to hide build
    # output which is the only thing printed to stdout.
    #
    # '\033[1;32m'        Set text to color '2' and make it bold.
    # '\033[m':           Reset text formatting.
    # '${3:-->}':         If the 3rd argument is missing, set prefix to '->'.
    # '${2:+\033[1;3Xm}': If the 2nd argument exists, set text style of '$1'.
    # '${2:+\033[m}':     If the 2nd argument exists, reset text formatting.
    printf '\033[1;33m%s \033[m%b%s\033[m %s\n' \
           "${3:-->}" "${2:+\033[1;36m}" "$1" "$2" >&2
}



# Quadsbot

log "quadsbot" "Setting up"

[ ! -d ./quadsbot ] && {
    log "quadsbot" "Not initialised, cloning..."

    git clone https://github.com/Akeboshiwind/quadsbot.git
}

log "quadsbot" "Updating"
cd ./quadsbot
git pull --rebase
cd ..

[ ! -s ./quadsbot.env ] && {
    log "quadsbot" "Env file missing or empty: quadsbot.env"
}
