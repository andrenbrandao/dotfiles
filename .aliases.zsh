# file in ~/.oh-my-zsh/custom/aliases.zsh

# fix external monitor with black screen
alias mfix="xrandr --output DP-1 --mode 1024x768 && sleep 3 && xrandr --output DP-1 --auto --left-of eDP-1"

# dotfiles alias for bare git repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
