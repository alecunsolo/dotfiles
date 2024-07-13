if (( ! $+commands[brew] )); then
  return
fi

if [[ -z "$HOMEBREW_PREFIX" ]]; then
  # Maintain compatability with potential custom user profiles, where we had
  # previously relied on always sourcing shellenv. OMZ plugins should not rely
  # on this to be defined due to out of order processing.
  export HOMEBREW_PREFIX="$(brew --prefix)"
fi

if [[ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]]; then
  (( ${fpath[(Ie)$HOMEBREW_PREFIX/share/zsh/site-functions]} )) || fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
fi

# Aliases
alias b='brew'
alias bi='brew install'
alias bci='brew --cask install'

alias bup='brew bundle install --cleanup'
