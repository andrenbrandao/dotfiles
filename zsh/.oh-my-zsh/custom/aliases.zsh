# file in ~/.oh-my-zsh/custom/aliases.zsh

# fix external monitor with black screen
alias mfix="xrandr --output DP-1 --mode 1024x768 && sleep 3 && xrandr --output DP-1 --auto --left-of eDP-1"

# neofetch
alias neofetch='neofetch --colors 212 159 212 212 --ascii_colors 103 212 103 --color_blocks off'

# ffmpeg video to gif
function ffvideo2gif() {
  ffmpeg -i $1 -r 15 -vf "scale=632:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -ss 00:00:00 $2
}

# gifski video to gif
# https://www.digitalocean.com/community/tutorials/how-to-make-and-optimize-gifs-on-the-command-line
function video2gif() {
  gifski --fps 15 --width 1200 -o gifski-sample.gif $1 && gifsicle -O3 --lossy=100 --colors 256 gifski-sample.gif -o $2 
}

# git
alias gprunesquashmerged='git checkout -q "$(git_main_branch)" && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base "$(git_main_branch)" $branch) && [[ $(git cherry "$(git_main_branch)" $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gprunelocalmerged="git branch --merged '$(git_main_branch)' | grep -v '^[ *]*$(git_main_branch)$' | xargs git branch -d"

# nvim
function backup_nvim() {
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
}

function restore_nvim_backup() {
  # required
  cp -r ~/.config/nvim{.bak,}

  # optional but recommended
  cp -r ~/.local/share/nvim{.bak,}
  cp -r ~/.local/state/nvim{.bak,}
  cp -r ~/.cache/nvim{.bak,}
}

function clean_nvim() {
  # required
  rm -rf ~/.config/nvim

  # optional but recommended
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
}

# copy command from history to clipboard
# example clip !10555
function clip() {
  echo "$@" | xclip -sel clip
}

# play any audio file from terminal
alias play='aplay'

# compiles c++ code
# takes the first argument as the main.cpp and the remaining cpp files should come after it
function compilec++() {
  local filename="${1%.*}"
  g++ -std=c++23 -pedantic-errors -Wall -Werror -Weffc++ -Wextra -Wconversion -Wsign-conversion "$@" -o "$filename"
}

# compiles c++ code and runs it
function runc++() {
  local filename="${1%.*}"
  compilec++ $@ && ./"$filename"
}

# ssh with xterm-256color to prevent problems such as 
# “E437: terminal capability “cm” required”
alias ssh='TERM=xterm-256color \ssh'
