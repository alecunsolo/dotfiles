# Load standard Homebrew shellenv into the shell session.
# Load 'HOMEBREW_' prefixed variables only. Avoid loading 'PATH' related
# variables as they are already handled in standard zsh configuration.
if (( $+commands[brew] )); then
    # $(brew shellenv 2> /dev/null) runs the brew shellenv command and gets its output.
    # (f) splits this output into an array of lines.
    # (@M) applies pattern matching to the array.
    # :#export HOMEBREW* filters the array, keeping only those elements that match the pattern export HOMEBREW*.
    eval "${(@M)${(f)"$(brew shellenv 2> /dev/null)"}:#export HOMEBREW*}"
fi

# Aliases
alias b='brew'
alias bi='brew install'
alias bci='brew --cask install'

alias bup='brew bundle install --cleanup'
