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

export EDITOR=code
export VISUAL=code
export TERM=kitty
export TERMINAL=kitty
export BROWSER=firefox
export MICRO_TRUECOLOR=1
export PATH="$HOME/bin:$PATH"

export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cp="cp -i"     
alias df='df -h'
alias top='sudo top'

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

alias c='clear'
alias vim='micro'
alias vi='micro'
alias nano='micro'
alias x='chmod +x'
alias R='ranger'
alias M='micro'
alias C='calc'

alias pacman='pacman --color auto'
alias u='yay -Syyu'
alias clean='sudo pacman -Rscn $(pacman -Qdtq)' 
alias unlock="sudo rm /var/lib/pacman/db.lck" 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

alias space="ncdu"
alias gpu='glxinfo|egrep "OpenGL vendor|OpenGL renderer"'
alias gut='sh /$HOME/bin/update_repositories.sh'

alias dotstow='cd $HOME/Git/dotfiles && for d in *; do stow -v -t ~ "$d" ;done'
alias keestow='cd $HOME/Git/kee/stow && for d in *; do stow -v -t ~ "$d" ;done'

alias jorbuntu="ssh joris@192.168.56.3" # Fontys

function cd() { # Add exa after a cd
  builtin cd "$@" && exa -l --color=always --group-directories-first
}

function ex() { # Extract compressed files
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

function f() { # Fuzzy find and launch files
  IFS=$'\n' out=("$(fzf -m --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

function fzfcd() { # Fuzzy find and cd to a directory
    cd $HOME && cd "$(fd -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

function fzfo() { # Fuzzy find and open a file
    fd -t f -H -I | fzf -m --preview='pistol {}' | xargs -ro -d "\n" xdg-open 2>&-
}

function i() { # Fuzzy find and install applications
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

function r() { # Fuzzy find and remove applications
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
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
