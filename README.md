# dotfiles

Zsh, tmux and other config files.

## How to clone to a new machine

Ref: <https://news.opensuse.org/2020/03/27/Manage-dotfiles-with-Git/>

First, clone to the local repository.

```
git clone --bare git@github.com:andrenbrandao/dotfiles.git $HOME/.dotfiles
```

Define the dotfiles alias to use for now.

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Hide the untracked files and checkout the repo.

```
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

After installing `oh-my-zsh`, make a symbolic link for the `aliazes.zsh` file.

```
ln -s ~/.aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
```

## How to update

Go to the current user and directory commit the files.

```
cd ~

dotfiles status

dotfiles add .tmux.conf

dotfiles commit -m "chore: update tmux conf"

dotfiles push
```

## Tmux Theme

<https://draculatheme.com/tmux>

![Tmux Screenshot](.github/tmux-screenshot.png)

## TODO

- [ ] Automate with GNU Stow: [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles), [Chris@Machine](https://www.youtube.com/watch?v=90xMTKml9O0&t=651s)

## References

- <https://news.opensuse.org/2020/03/27/Manage-dotfiles-with-Git/>
- <https://dotfiles.github.io/>
- <https://www.atlassian.com/git/tutorials/dotfiles>
- <https://github.com/webpro/awesome-dotfiles>
- <http://iamnotmyself.com/2020/11/10/your-terminal-and-you-dotfiles/>
- <https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/>
- <https://gruby.medium.com/dotfile-how-to-manage-and-sync-with-git-gnu-stow-6beada1529ea>
- <https://github.com/holman/dotfiles>
