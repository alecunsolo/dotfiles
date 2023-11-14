#!/usr/bin/env sh

git_clone_or_pull() {
    local source=$1
    local dest=$2
    if [ -d "$dest" ]; then
        echo "Pulling repository ${dest}"
        git -C $dest pull
    else
        echo "Cloning $source to $dest"
        git clone $source $dest
    fi
}

# powerlevel10k
git_clone_or_pull https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-custom}/themes/powerlevel10k
# autosuggestions
git_clone_or_pull https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${HOME}/.oh-my-custom}/plugins/zsh-autosuggestions
# syntax
git_clone_or_pull https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${HOME}/.oh-my-custom}/plugins/zsh-syntax-highlighting
