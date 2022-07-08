#	.bashrc
#
#	By Joris van Dijk | gitlab.com/jorisvandijk 
#	Licensed under the GNU General Public License v3.0

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
export HISTSIZE=5000
export HISTCONTROL=erasedups:ignoredups:ignorespace
export PROMPT_COMMAND='history -a'

export EDITOR=micro
export VISUAL='kitty -e micro'
export TERM=kitty
export TERMINAL=kitty

export MICRO_TRUECOLOR=1
# export PATH="$HOME/bin:$PATH"
export PATH="/home/joris/Dotfiles/bin/bin"
export PATH="$PATH:/usr/sbin/"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias nano='micro'
alias c='clear'

alias i='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
alias s='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias u='yay -Syyu'
alias r='pacman -Qq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns'
alias y='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
alias maint='sh $HOME/bin/ArchMaintainer'

alias ls='exa -lb --header --color=always --group-directories-first --long --git' 
alias la='exa -lab --header --color=always --group-directories-first --long --git'  
alias lh='exa -a | egrep "^\."' 

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias gut='Git'
alias add='git add .'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias 11='npx @11ty/eleventy --serve'

alias gpu='glxinfo|egrep "OpenGL vendor|OpenGL renderer"'

alias dotstow='cd $HOME/Dotfiles && for d in *; do stow -v -t ~ "$d" ;done'

alias jorbuntu="ssh joris@192.168.56.3" # Fontys

function cd() { # Add exa after a cd
  builtin cd "$@" && exa -lb --header --color=always --group-directories-first --long --git
}

function o() {
  IFS=$'\n' out=("$(fzf-tmux --preview='head -$LINES {}' --preview-window=up --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}
