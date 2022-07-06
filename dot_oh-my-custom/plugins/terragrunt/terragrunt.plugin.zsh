# If terragrunt is not installed do nothing
if [[ ! -x "${commands[terragrunt]}" ]]; then
    return
fi

alias tg='terragrunt'
alias tgp='terragrunt plan'
alias tga='terragrunt apply'
alias tgi='terragrunt init'
alias tgf='terragrunt hclfmt'
alias tgo='terragrunt output'

alias tgpf='terragrunt plan -out terragrunt.plan'
alias tgaf='terragrunt apply terragrunt.plan'

tgpaf() {
    local PLANFILE=terragrunt.plan
    if ! terragrunt plan -out $PLANFILE ; then
        echo "Failed to plan"
        return 1
    fi
    if read -t 5 -s -q "RESP?Do you want to apply this? [y/N] " ; then
        echo "Ok"
        terragrunt apply $PLANFILE
    else
        echo "No harm done"
        echo "You can manually apply this plan with \"terragrunt apply $PLANFILE\""
    fi
}

