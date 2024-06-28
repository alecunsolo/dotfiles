if (( $+commands[nvim] )); then
    alias vim='nvim'
    alias vimdiff='nvim -d'
fi

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

# Directory stuff
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir
alias mkdt='cd $(mktemp -d)'

# Restart gpg agent
alias gpg-restart='gpg-connect-agent reloadagent /bye'

# Flush dns on Mac
alias flush-dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

alias rand-string='openssl rand -base64'

# Bat global aliases
if (( ${+commands[bat]} )); then
    alias cat='bat'
    alias -g B=' | bat'
    alias -g By=' | bat -l yaml'
    alias -g Bj=' | bat -l json'
fi
# Debian variation
if (( ${+commands[batcat]} )); then
    alias cat='batcat'
    alias bat='batcat'
    alias -g B=' | batcat'
    alias -g By=' | batcat -l yaml'
    alias -g Bj=' | batcat -l json'
fi

if (( ${+commands[fdfind]} )); then
    alias fd='fdfind'
fi

if (( ${+commands[jq]} )); then
    alias -g J=' | jq'
fi
if (( $+commands[kubectl] )); then
    # Additional aliases in addition to the OMZ ones
    alias kg='kubectl get'
    alias ke='kubectl edit'
fi
