#	.bashrc
#
#	By Joris van Dijk | gitlab.com/jorisvandijk 
#	Licensed under the GNU General Public License v3.0

[[ $- != *i* ]] && return
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

PS1='\n\[\e[1;34m\] \W \[\e[m\]'
PATH="$HOME/bin:${PATH:+:${PATH}}"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind "set completion-ignore-case on"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

shopt -s autocd
shopt -s histappend

export EDITOR=micro
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" '
export HISTCONTROL=erasedups:ignoredups:ignorespace
export HISTFILESIZE=10000
export HISTSIZE=5000
export MICRO_TRUECOLOR=1
export PROMPT_COMMAND='history -a'
export TERM=kitty
export TERMINAL=kitty
export VISUAL='kitty -e micro'

alias ..='cd ..'
alias 11='npx @11ty/eleventy --serve'
alias add='git add .'
alias c='clear'
alias clean='sh $HOME/bin/ArchMaintainer'
alias commit='git commit -m'
alias dotstow='cd $HOME/Dotfiles && for d in *; do stow -v -t ~ "$d" ;done'
alias fetch='git fetch'
alias gpu='glxinfo|egrep "OpenGL vendor|OpenGL renderer"'
alias grep='grep --color=auto'
alias gut='Git'
alias i='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
alias ls='exa -lab --header --color=always --group-directories-first --long --git --icons'  
alias nano='micro'
alias pull='git pull origin'
alias push='git push origin'
alias r='pacman -Qq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns'
alias status='git status'
alias u='yay -Syyu'
alias ur='UpdateRepositories'
alias w='curl wttr.in'

function cd() { # Add exa after a cd
  builtin cd "$@" && exa -lb --header --color=always --group-directories-first --long --git --icons
}

eval "$(thefuck --alias)"
