# Usage: .bashrc file, bash config file.
#
# Dotfile by Joris van Dijk | gitlab.com/jorisvandijk
#
#          Published under GPL-3.0-or-later

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set PS1
PS1='\n\[\e[1;34m\] \W \[\e[m\]'

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# limits recursive functions, see 'man bash'
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Automatically ls when changing directory.
cd() {
  builtin cd "$@" && exa -l --color=always --group-directories-first
}

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Add bin to PATH
export PATH="$HOME/bin:$PATH"

# Set the defaults
export EDITOR=code
export VISUAL=code
export TERM=kitty
export TERMINAL=kitty
export BROWSER=firefox
export MICRO_TRUECOLOR=1

# Term fix
# if [ "$TERM" = xterm ]; then
#   TERM=xterm-256color
# fi
# export TERM=xterm-256color

# Use auto cd
shopt -s autocd

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Stow
alias dotstow='cd $HOME/Git/dotfiles && for d in *; do stow -v -t ~ "$d" ;done'
alias keestow='cd $HOME/Git/kee/stow && for d in *; do stow -v -t ~ "$d" ;done'

# Joris' aliasses
alias pacman='pacman --color auto'
alias u='sudo yay -Syyu'
alias clean='sudo pacman -Rscn $(pacman -Qdtq)' # will search for orphaned packages and delete them
alias unlock="sudo rm /var/lib/pacman/db.lck" # remove pacman lock
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# See where stuff is
alias space="ncdu"

# Grab fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

# Changing "ls" to "exa"
alias ls='exa -l --color=always --group-directories-first'  # list visible files and folders
alias la='exa -la --color=always --group-directories-first' # list all files and folders
alias lh='exa -a | egrep "^\."'                             # list only hidden files and folders

alias gpu='glxinfo|egrep "OpenGL vendor|OpenGL renderer"'
alias top='sudo top'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Adding flags
alias cp="cp -i"     # confirm before overwriting something
alias df='df -h'     # human-readable sizes

# Git
alias add='git add .'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'

alias gut='sh /$HOME/bin/update_repositories.sh'

# Other
alias c='clear'
alias vim='micro'
alias vi='micro'
alias nano='micro'
alias x='chmod +x'
alias R='ranger'
alias P='pulsemixer'
alias M='micro'
alias C='calc'

# Fontys
alias jorbuntu="ssh joris@192.168.56.3"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *.deb) ar x $1 ;;
    *.tar.xz) tar xf $1 ;;
    *.tar.zst) unzstd $1 ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Dracula
if [ "$TERM" = "linux" ]; then
  printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
  printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
  printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
  printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
  printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
  printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
  printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
  printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
  printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
  printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
  printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
  printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
  printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
  printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
  printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
  printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
  printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
  printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
  clear
fi

# FZF
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export FZF_DEFAULT_COMMAND='find .'

# Install packages using yay (change to pacman/AUR helper of your choice)
function i() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

# Remove installed packages (change to pacman/AUR helper of your choice)
function r() {
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
}

# Find files
function f() {
  IFS=$'\n' out=("$(fzf -m --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

function open_with_fzf() {
    fd -t f -H -I | fzf -m --preview='pistol {}' | xargs -ro -d "\n" xdg-open 2>&-
}

function cd_with_fzf() {
    cd $HOME && cd "$(fd -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

#two spaces after the d backslash (avoiding nested single quote hell)
alias winact='wmctrl -i -R $(wmctrl -l | fzf | cut -d\  -f1)'


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
