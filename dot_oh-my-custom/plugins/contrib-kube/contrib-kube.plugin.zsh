#!/bin/zsh

if (( $+commands[kubectl] )); then
    source "${0:h}/kubectl.zsh"
fi
if (( $+commands[kustomize] )); then
    source "${0:h}/kustomize.zsh"
fi
