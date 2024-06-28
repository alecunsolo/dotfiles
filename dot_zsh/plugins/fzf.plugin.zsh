# if fzf is not installed do nothing
if (( ! $+commands[fzf] )); then
    return
fi

eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix --follow --exclude .snapshots --exclude .git'
export FZF_DEFAULT_OPTS='--ansi --reverse --bind one:accept,zero:abort,ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

# Select an alias
function fas() {
    local cmd
    if [[ -n $1 ]]; then
        cmd=$(alias | fzf --ansi --no-multi --reverse -q $1 | awk -F '=' '{ print $1 }')
    else
        cmd=$(alias | fzf --ansi --no-multi --reverse | awk -F '=' '{ print $1 }')
    fi
    [[ -n $cmd ]] && print -z $cmd
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

# git log show with fzf
function gli() {
  local filter
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  git log --graph --color=always --abbrev=7 --format='%C(auto)%h %an %C(blue)%s %C(yellow)%cr' $@ | \
    fzf --tmux --ansi --no-sort --reverse --tiebreak=index \
        --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}" \
        --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF" \
        --preview-window=right:60% \
        --height 80%
}

# Interactive branch checkout
function gswb() {
    git rev-parse 2>/dev/null || return 0

    local br
    br=$(git --no-pager branch | cut -c 3- | fzf)
    [[ -n $br ]] && git switch $br
}
