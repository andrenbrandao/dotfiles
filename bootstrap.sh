#!/usr/bin/env bash
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="git,nvim,tmux,zsh,bin,guake"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/dotfiles
fi

STOW_FOLDERS=$STOW_FOLDERS DOTFILES=$DOTFILES

pushd $DOTFILES

# stow folders
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done

# stow X11 config
echo "stow X11"
sudo stow -D X11 --target=/ -v
sudo stow X11 --target=/ -v

popd
