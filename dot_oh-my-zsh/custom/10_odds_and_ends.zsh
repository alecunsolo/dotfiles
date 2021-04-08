#!/bin/zsh

# Start or attach to a tmux session with the given name ('main' as default)
function txa() {
    tmux new-session -A -s ${1:-main}
}

alias tmuxp='PYENV_VERSION=tmuxp tmuxp'

# Create a temporary directory and go there
function mkdt() {
    local dir
    dir=$(mktemp -d)
    cd $dir
}

# External ip
function ext-ip() {
    if (( ${+commands[dig]} )); then
        dig +short myip.opendns.com @resolver1.opendns.com
        return $?
    else
        print "dig not installed" >&2
        return 1
    fi
}

# Suffix aliases
alias -s {yaml,json}=$EDITOR

# Global aliases
if (( ${+commands[bat]} )); then
    alias -g B=' | bat'
fi
