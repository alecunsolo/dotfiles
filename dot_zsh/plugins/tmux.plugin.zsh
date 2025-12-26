# Start or attach to a tmux session with the given name ('main' as default)
txa() {
  tmux new-session -A -s ${1:-main}
}

# Switch/attach to a tmux session
txsw() {
  local query session action
  [[ -n "$1" ]] && query="--query=$1"
  session=$(tmux list-sessions | fzf --tmux --ansi --no-multi --reverse $query | awk -F ':' '{print $1}')
  [[ -z $session ]] && return 0
  if [[ -n $TMUX ]]
  then
    action='switch-client'
  else
    action='attach-session'
  fi
  tmux $action -t $session
}

# Based on the Primeagen's script:
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
txs() {
  # Set default starting point
  BASE="${1:-$HOME/code}"

  # Use fd and fzf to select the target directory
  selected=$(fd -uu -td '\.git$' --base-directory "$BASE" | sed -E 's:/\.git/$::' | sort -u | fzf --tmux --no-multi)

  if [[ -z "${selected}" ]]; then
    return 0
  fi

  # Set the session name
  selected_name=$(basename $selected | tr . _)

  # Is tmux running?
  tmux_running=$(pgrep tmux)
  if [[ -z "$tmux_running" ]]; then
    # Tmux is not running. Create a new session
    tmux new-session -s $selected_name -c $selected
    return 0
  fi

  # Ok, so now I know that tmux is running.
  # I'm already in a tmux session?
  if [[ -z "$TMUX" ]]; then
    # No, so create a new session or attach to
    # the already existent one and be done
    tmux new-session -A -s $selected_name -c $selected
    return 0
  fi

  # Does the requested session already exist?
  if ! tmux has-session -t=$selected_name 2> /dev/null ; then
    # Create a new detached session
    tmux new-session -d -s $selected_name -c $selected
  fi

  # Now I know the session I want exists
  tmux switch-client -t=$selected_name
}
