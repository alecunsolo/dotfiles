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

# Reconnect to ssh-agent. Use with caution
# See: https://tychoish.com/post/9-awesome-ssh-tricks/
function ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
      export SSH_AUTH_SOCK=$agent
      if ssh-add -l 2>&1 > /dev/null; then
         echo "Found working SSH Agent:"
         ssh-add -l
         return
      fi
  done
  echo "Cannot find ssh agent - maybe you should reconnect and forward it?"
}

# Sync pihole
function sync-local-dns {
    ssh devops@pihole02 /home/devops/gravity-sync/gravity-sync.sh pull
}
