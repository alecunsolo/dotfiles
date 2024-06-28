# If terragrunt is not installed do nothing
if (( ! $+commands[zoxide] )); then
    return
fi

eval "$(zoxide init --cmd ${ZOXIDE_CMD_OVERRIDE:-cd} zsh)"
