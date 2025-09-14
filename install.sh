#!/usr/bin/env bash
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="nvim,vim,tmux,zsh,bin,guake,albert,alacritty"
fi

# stow folders
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D --target "$HOME" $folder
    stow --target "$HOME" $folder
done
