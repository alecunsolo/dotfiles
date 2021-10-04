# Aliases
alias kg='kubectl get'
alias ke='kubectl edit'
alias -g _Y='-o yaml'

if (( $+commands[yq] )); then
    alias -g _SY="-o yaml | yq eval 'del(.metadata.managedFields)' -"
fi
