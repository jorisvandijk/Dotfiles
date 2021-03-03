# Usage: .bashrc file, bash config file.
#
# Dotfile by Joris van Dijk | gitlab.com/jorisvandijk 
#
#          Published under GPL-3.0-or-later

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set PS1
PS1='\n\[\e[1;34m\]\W \[\e[m\]'

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

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim

# Use auto cd
shopt -s autocd

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Joris' aliasses
alias u='sudo pacman -Syyu'
alias i='sudo pacman -S'
alias r='sudo pacman -Rs'
alias s='pacman -Ss'
alias clean='pacman -Rscn $(pacman -Qdtq)' # will search for orphaned packages and delete them

alias yu='yay -Syyu'
alias yi='yay -S'
alias yr='yay -Rs'
alias ys='yay -Ss'

alias fullupdate="yay -Syyu --noconfirm"              # update standard pkgs and AUR pkgs
alias unlock="sudo rm /var/lib/pacman/db.lck"        # remove pacman lock
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias sb='cd ~/Scripts/bash'
alias sp='cd ~/Scripts/python'

# Changing "ls" to "exa"
alias ls='exa -l --color=always --group-directories-first' # list visible files and folders
alias la='exa -la --color=always --group-directories-first'  # list all files and folders
alias lh='exa -a | egrep "^\."' # list only hidden files and folders

alias gpu='glxinfo|egrep "OpenGL vendor|OpenGL renderer"'
alias top='sudo top'
alias gut='python -u ~/Scripts/python/git.py'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# adding flags
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# git
alias add='git add -u'
alias addall='git add .'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'

alias c='clear'
alias vim='nvim'
alias vi='nvim'
alias nano='micro'
alias x='chmod +x'
