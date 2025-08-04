#!/usr/bin/env bash
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="nvim,tmux,zsh,bin,guake,albert"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/dotfiles
fi

pushd $DOTFILES

# stow folders
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D --target "$HOME" $folder
    stow --target "$HOME" $folder
done

# stow X11 config
echo "stow X11"
sudo stow -D X11 --target=/ -v
sudo stow X11 --target=/ -v

popd
