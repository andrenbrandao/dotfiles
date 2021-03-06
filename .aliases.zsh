# file in ~/.oh-my-zsh/custom/aliases.zsh

# fix external monitor with black screen
alias mfix="xrandr --output DP-1 --mode 1024x768 && sleep 3 && xrandr --output DP-1 --auto --left-of eDP-1"

# dotfiles alias for bare git repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# neofetch
alias neofetch='neofetch --colors 212 159 212 212 --ascii_colors 103 212 103 --color_blocks off'

# ffmpeg video to gif
function video2gif() {
  ffmpeg -i $1 -r 15 -vf "scale=632:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -ss 00:00:00 $2
}

# git
alias gprunesquashmerged='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
