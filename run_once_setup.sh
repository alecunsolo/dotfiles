#!/bin/bash

set -xe

# oh-my-zsh
ZSH=${ZSH:-~/.oh-my-zsh}
if [ -d "$ZSH" ]; then
    echo "oh-my-zsh already installed in $ZSH. Nothing to do"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
