(( $+commands[kustomize] )) || return

alias ku=kustomize
# Build
alias kub='kustomize build'
# Create
alias kuc='kustomize create'
# Edit
alias kuea='kustomize edit add'
alias kues='kustomize edit set'
alias kuer='kustomize edit remove'

function kuapp {
    cat <<EOF
This will run 'kustomize build . | kubectl apply -f-'
The directory is $PWD and the context is $(kubectl config current-context)
EOF
    if ! read -s -t 3 -q "?Are you sure?"; then
        >&2 echo $REPLY
        echo 'No harm done'
        return 0
    fi
    >&2 echo $REPLY
    echo 'How brave!'
    kustomize build . | kubectl apply -f-
}
