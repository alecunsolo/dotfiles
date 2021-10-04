# If chezmoi is not installed do nothing
if [[ ! -x "${commands[chezmoi]}" ]]; then
    return
fi

# Completion
__CHEZMOI_COMPLETION_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/chezmoi_completion"
mkdir -p ${__CHEZMOI_COMPLETION_FILE:h}

if [[ ! -f $__CHEZMOI_COMPLETION_FILE || ! -s $__CHEZMOI_COMPLETION_FILE ]]; then
    chezmoi completion zsh >! $__CHEZMOI_COMPLETION_FILE
fi

[[ -f $__CHEZMOI_COMPLETION_FILE ]] && source $__CHEZMOI_COMPLETION_FILE

unset __CHEZMOI_COMPLETION_FILE

# Aliases
alias cz='chezmoi'

alias cz+='chezmoi add'
alias cza='chezmoi apply'
alias czan='chezmoi apply --dry-run'
alias czav='chezmoi apply --verbose'
alias czavn='chezmoi apply --verbose --dry-run'
alias czcd='chezmoi cd'
alias czi='chezmoi init'
