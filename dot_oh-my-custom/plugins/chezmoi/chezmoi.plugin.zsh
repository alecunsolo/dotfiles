# If chezmoi is not installed do nothing
if [[ ! -x "${commands[chezmoi]}" ]]; then
    return
fi

# Aliases
alias cz='chezmoi'

alias cz+='chezmoi add'
alias cza='chezmoi apply'
alias czan='chezmoi apply --dry-run'
alias czav='chezmoi apply --verbose'
alias czavn='chezmoi apply --verbose --dry-run'
alias czcd='chezmoi cd'
alias czi='chezmoi init'
