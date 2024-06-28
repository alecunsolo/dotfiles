# Force password authentication
alias ssh-pwd='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
# Do not store ssh host key
alias ssh-temp='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
# Both options
alias ssh-unsecure='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Reconnect to ssh-agent. Use with caution
# See: https://tychoish.com/post/9-awesome-ssh-tricks/
function ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
      export SSH_AUTH_SOCK=$agent
      if ssh-add -l 2>&1 > /dev/null; then
         __log "Found working SSH Agent:"
         ssh-add -l
         return
      fi
  done
  __die "Cannot find ssh agent - maybe you should reconnect and forward it?"
}

# Remove host(s) from known_hosts
function ssh-unknow-hosts() {
    if [ ${#@[@]} -eq 0 ]; then
        __die "Must pass at least one host"
    fi
    for host in $@; do
        ssh-keygen -R $host
    done
}

# Copy pub SSH key to clipboard (clipcopy is a OMZ function)
function ssh-clipcopy-pubkey() {
    local __key __query
    [[ -n "$1" ]] && __query="--query=$1"

    __key=$(fd --type f '\.pub$' ~/.ssh | fzf $__query --ansi --sort -m)
    [[ -n "$__key" ]] && clipcopy $__key
    return 0
}

# preview/edit ssh config file
function ssh-config() {
    local __base_dir __file
    __base_dir="$HOME/.ssh"
    __file=$(fd --type f --follow config --base-directory=${__base_dir} --strip-cwd-prefix --full-path --color=always |\
        fzf --ansi --no-multi \
        --preview "bat --color=always -l sshd_config ${__base_dir}/{}")
    [[ -n $__file ]] && nvim ${__base_dir}/${__file} || return 0
}
