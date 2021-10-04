#!/bin/bash

set -e

# oh-my-zsh
ZSH=${ZSH:-~/.oh-my-zsh}
if [ -d "$ZSH" ]; then
    echo "oh-my-zsh already installed in $ZSH. Nothing to do"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

