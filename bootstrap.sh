#!/usr/bin/env bash
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="git,nvim,tmux,zsh,bin,guake,albert"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/dotfiles
fi

pushd $DOTFILES

# stow folders
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done

# stow private dotfiles
pushd "./private"
./stow
popd

# stow X11 config
echo "stow X11"
sudo stow -D X11 --target=/ -v
sudo stow X11 --target=/ -v

# load gnome keybindings
echo "loading gnome keybindings..."
dconf load /org/gnome/shell/keybindings/ < ./gnome/keybindings.dconf

popd
