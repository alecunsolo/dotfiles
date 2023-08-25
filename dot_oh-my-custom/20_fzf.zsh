# if fzf is not installed do nothing
if [[ ! $+commands[fzf] ]]; then
    return
fi

#   ____             __ _
#  / ___|___  _ __  / _(_) __ _
# | |   / _ \| '_ \| |_| |/ _` |
# | |__| (_) | | | |  _| | (_| |
#  \____\___/|_| |_|_| |_|\__, |
#                         |___/
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .snapshots --exclude .git'
export FZF_DEFAULT_OPTS='--ansi --reverse --bind ctrl-f:page-down,ctrl-b:page-up'

#   ____                           _
#  / ___| ___ _ __   ___ _ __ __ _| |
# | |  _ / _ \ '_ \ / _ \ '__/ _` | |
# | |_| |  __/ | | |  __/ | | (_| | |
#  \____|\___|_| |_|\___|_|  \__,_|_|
#
# Fuzzy change directory
function fcd() {
    local dir
    dir=$(fd --type d --color=always . "${1:-.}" | fzf --ansi +m --reverse)
    if [[ -n $dir ]]; then
        cd $dir
    fi
}

# Fuzzy change directory
function fcda() {
    local dir
    dir=$(fd --type d --color=always --hidden . "${1:-.}" | fzf --ansi --reverse +m)
    if [[ -n $dir ]]; then
        cd $dir
    fi
}

# Go to a repo dir
function rcd() {
    [[ -d ~code ]] || return 0
    local dir cdir
    cdir=$PWD
    cd ~code
    if [[ -n $1 ]]; then
        dir=$(fd --type d --color=always --max-depth 2 | fzf --ansi --reverse +m -q $1)
    else
        dir=$(fd --type d --color=always --max-depth 2 | fzf --ansi --reverse +m)
    fi
    if [[ -n "$dir" ]]; then
        cd $dir
    else
        cd $cdir
    fi
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

#  ____ ____  _   _
# / ___/ ___|| | | |
# \___ \___ \| |_| |
#  ___) |__) |  _  |
# |____/____/|_| |_|
#
# Copy pub SSH key(s) to clipboard
function ssh-key-to-clip() {
    # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion
    # ${+name}
    #   If name is the name of a set parameter ‘1’ is substituted, otherwise ‘0’ is substituted.
    local keys
    if [[ -n "$1" ]]; then
        keys=$(fd --type f '\.pub$' ~/.ssh | fzf --ansi --sort -m -q $1)
    else
        keys=$(fd --type f '\.pub$' ~/.ssh | fzf --ansi --sort -m)
    fi
    if [[ -n "$keys" ]]; then
        if (( $+commands[xclip] )); then
            xclip -in -selection clipboard $key
        elif (( $+commands[pbcopy] )); then
            echo $keys | pbcopy
        else
            print "ssh-clip-key: xclip/pbcopy not installed" >&2
            return 1
        fi
    fi
    return 0
}

# Show ssh-config
function ssh-config() {
    cd ~/.ssh
    fd --type f --follow config . --full-path --color=always |\
        fzf --ansi --no-multi \
        --preview 'bat --color=always -l sshd_config {}' --bind "e:execute(vim {} < /dev/tty > /dev/tty),q:abort" > /dev/null
    cd - > /dev/null
}

#  ____             _
# |  _ \  ___   ___| | _____ _ __
# | | | |/ _ \ / __| |/ / _ \ '__|
# | |_| | (_) | (__|   <  __/ |
# |____/ \___/ \___|_|\_\___|_|
#
#select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}

#   ____ _ _
#  / ___(_) |_
# | |  _| | __|
# | |_| | | |_
#  \____|_|\__|
#
# git log show with fzf
function gli() {
  local filter
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  git log \
    --graph --color=always --abbrev=7 --format='%C(auto)%h %an %C(blue)%s %C(yellow)%cr' $@ | \
    fzf \
      --ansi --no-sort --reverse --tiebreak=index \
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
function g-sb() {
    git rev-parse 2>/dev/null || return 0

    local br
    br=$(git --no-pager branch | cut -c 3- | fzf)
    [[ -n $br ]] && git switch $br
}

#  ____
# |  _ \ __ _  ___ _ __ ___   __ _ _ __
# | |_) / _` |/ __| '_ ` _ \ / _` | '_ \
# |  __/ (_| | (__| | | | | | (_| | | | |
# |_|   \__,_|\___|_| |_| |_|\__,_|_| |_|
function pacselect() {
    local packages
    packages=($(yay -Sl --color=always $1 | fzf --ansi \
        --multi \
        --layout=reverse \
        --preview '{yay -Si {2}}' \
        --bind "alt-j:preview-down,alt-k:preview-up" |\
        awk '{print $2}'))
    print ${#packages}
    print ${(j: :)packages}
}

# Interactive select packages to remove
function pac-interactive-remove() {
    local packages
    packages=( $(yay -Qe --color=always |\
        fzf --ansi \
            --multi \
            --layout=reverse \
            --preview '{yay -Si {1}}' \
            --bind "alt-j:preview-down,alt-k:preview-up" |\
            awk '{print $1}') )
    (( ${#packages})) && yay -Rns $packages
}

