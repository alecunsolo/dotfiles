#!/usr/bin/env bash

action=$1
message=$2

[[ -n "$action" ]] || exit 1
[[ -n "$message" ]] || exit 1

# Use Zenity to ask for confirmation
if zenity --question --text="$message"; then
    # If user confirms, execute the action
    $action
else
    echo "Action canceled."
fi
