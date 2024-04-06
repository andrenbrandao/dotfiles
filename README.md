# dotfiles

Zsh, tmux and other config files.

These are my personal dotfiles. Take anything you want, but at your own risk.

![Tmux Screenshot](.github/tmux-screenshot.png)

## How to install

Install [git](https://git-scm.com/) and [gnu stow](https://www.gnu.org/software/stow/).

Clone repo to a new machine and store it in `~/dotfiles`.

```bash
git clone https://github.com/andrenbrandao/dotfiles.git ~/dotfiles
```

Run `bootstrap.sh` to symlink all the config with `stow`.

```bash
cd ~/dotfiles
./bootstrap.sh
```

## References

How I set up my terminal: [Terminal Setup with Zsh + Tmux + Dracula Theme](https://andrebrandao.me/articles/terminal-setup-with-zsh-tmux-dracula-theme/)

Articles and other links that helped me create these dotfiles.

- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Chris@Machine Video](https://www.youtube.com/watch?v=90xMTKml9O0)
- [ThePrimeagen's Dotfiles](https://github.com/ThePrimeagen/.dotfiles)
