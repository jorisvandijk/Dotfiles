# bashrc - Bash config file
# Joris van Dijk | https://gitlab.com/jorisvandijk
# Published under GPL-3.0-or-later

[[ $- != *i* ]] && return
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

PS1='\n\[\e[1;34m\] \W \[\e[m\]'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind "set completion-ignore-case on"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

shopt -s autocd
shopt -s histappend

export HISTFILESIZE=10000
export HISTSIZE=500
export HISTCONTROL=erasedups:ignoredups:ignorespace
export PROMPT_COMMAND='history -a'

export EDITOR=micro
export VISUAL=mousepad
export TERM=kitty
export TERMINAL=kitty
export BROWSER=firefox
export MICRO_TRUECOLOR=1
export PATH="$HOME/bin:$PATH"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias sudo='doas'
alias c='clear'

alias i='doas apt install'
alias u='doas apt update && doas apt upgrade'
alias r='doas apt purge'
alias clean='doas apt autoremove && doas apt autoclean'

alias ls='exa -l --color=always --group-directories-first'  
alias la='exa -la --color=always --group-directories-first' 
alias lh='exa -a | egrep "^\."' 

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias add='git add .'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'

alias gpu='glxinfo|egrep "OpenGL vendor|OpenGL renderer"'
alias gut='sh /$HOME/bin/update_repositories.sh'

alias dotstow='cd $HOME/Git/dotfiles && for d in *; do stow -v -t ~ "$d" ;done'
alias keestow='cd $HOME/Git/kee/stow && for d in *; do stow -v -t ~ "$d" ;done'

alias jorbuntu="ssh joris@192.168.56.3" # Fontys

function cd() { # Add exa after a cd
  builtin cd "$@" && exa -l --color=always --group-directories-first
}

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


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
