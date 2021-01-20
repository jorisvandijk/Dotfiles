#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_my_PS1() {
   # PS1='[\u@\h \W]\$ '
     PS1='[\W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /etc/os-release | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_my_PS1
unset -f _set_my_PS1

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.


_GeneralCmdCheck() {
    # A helper for functions UpdateArchPackages and UpdateAURPackages.

    echo "$@" >&2
    "$@" || {
        echo "Error: '$*' failed." >&2
        exit 1
    }
}

_CheckInternetConnection() {
    curl --silent --connect-timeout 8 https://8.8.8.8 >/dev/null
    local result=$?
    test $result -eq 0 || echo "No internet connection!" >&2
    return $result
}

_CheckArchNews() {
    local conf=/etc/eos-update-notifier.conf

    if [ -z "$CheckArchNewsForYou" ] && [ -r $conf ] ; then
        source $conf
    fi

    if [ "$CheckArchNewsForYou" = "yes" ] ; then
        local news="$(yay -Pw)"
        if [ -n "$news" ] ; then
            echo "Arch news:" >&2
            echo "$news" >&2
            echo "" >&2
            # read -p "Press ENTER to continue (or Ctrl-C to stop): "
        else
            echo "No Arch news." >&2
        fi
    fi
}

UpdateArchPackages() {
    # Updates Arch packages.

    _CheckInternetConnection || return 1

    _CheckArchNews

    #local updates="$(yay -Qu --repo)"
    local updates="$(checkupdates)"
    if [ -n "$updates" ] ; then
        echo "Updates from upstream:" >&2
        echo "$updates" | sed 's|^|    |' >&2
        _GeneralCmdCheck sudo pacman -Syu "$@"
        return 0
    else
        echo "No upstream updates." >&2
        return 1
    fi
}

UpdateAURPackages() {
    # Updates AUR packages.

    _CheckInternetConnection || return 1

    local updates
    if [ -x /usr/bin/yay ] ; then
        updates="$(yay -Qua)"
        if [ -n "$updates" ] ; then
            echo "Updates from AUR:" >&2
            echo "$updates" | sed 's|^|    |' >&2
            _GeneralCmdCheck yay -Syua "$@"
        else
            echo "No AUR updates." >&2
        fi
    else
        echo "Warning: /usr/bin/yay does not exist." >&2
    fi
}

UpdateAllPackages() {
    # Updates all packages in the system.
    # Upstream (i.e. Arch) packages are updated first.
    # If there are Arch updates, you should run
    # this function a second time to update
    # the AUR packages too.

    UpdateArchPackages || UpdateAURPackages
}


_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1: Do not use for executable files!
    # Note2: uses mime bindings, so you may need to use
    #        e.g. a file manager to make some file bindings.

    local progs="xdg-open exo-open"     # One of these programs is used.
    local prog
    for prog in $progs ; do
        if [ -x /usr/bin/$xx ] ; then
            $prog "$@" >& /dev/null &
            return
        fi
    done
    echo "Sorry, none of programs [$progs] is found." >&2
    echo "Tip: install one of packages" >&2
    for prog in $progs ; do
        echo "    $(pacman -Qqo "$prog")" >&2
    done
}

# Add 'cl' command to cd into a folder and then list the content with ls.
cl() { cd "$@" && ls; }

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

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
################################################################################

# Joris' aliasses

alias u='sudo pacman -Syyu'
alias i='sudo pacman -S'
alias r='sudo pacman -Rs'
alias s='pacman -Ss'
alias fullupdate="yay -Syyu --noconfirm"              # update standard pkgs and AUR pkgs
alias unlock="sudo rm /var/lib/pacman/db.lck"        # remove pacman lock
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Changing "ls" to "exa" 
alias ls='exa -l --color=always --group-directories-first' # list visible files and folders
alias la='exa -la --color=always --group-directories-first'  # list all files and folders
alias lh='exa -a | egrep "^\."' # list only hidden files and folders

alias gpu='glxinfo|egrep "OpenGL vendor|OpenGL renderer"'
alias top='sudo top'
alias run='python -u ~/Scripts/all.py' 
alias gut='python -u ~/Scripts/python/git.py'
alias bat='notify-send |upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias server='./ssh.sh'

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
alias branch='git branch'
alias checkout='git checkout'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

alias c='clear'
alias vim='nvim'
alias vi='nvim'

# Set up command prompt

alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
function __setprompt
{
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"

	# Show error exit code if there is one
	if [[ $LAST_COMMAND != 0 ]]; then
		# PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
		PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
		if [[ $LAST_COMMAND == 1 ]]; then
			PS1+="General error"
		elif [ $LAST_COMMAND == 2 ]; then
			PS1+="Missing keyword, command, or permission problem"
		elif [ $LAST_COMMAND == 126 ]; then
			PS1+="Permission problem or command is not an executable"
		elif [ $LAST_COMMAND == 127 ]; then
			PS1+="Command not found"
		elif [ $LAST_COMMAND == 128 ]; then
			PS1+="Invalid argument to exit"
		elif [ $LAST_COMMAND == 129 ]; then
			PS1+="Fatal error signal 1"
		elif [ $LAST_COMMAND == 130 ]; then
			PS1+="Script terminated by Control-C"
		elif [ $LAST_COMMAND == 131 ]; then
			PS1+="Fatal error signal 3"
		elif [ $LAST_COMMAND == 132 ]; then
			PS1+="Fatal error signal 4"
		elif [ $LAST_COMMAND == 133 ]; then
			PS1+="Fatal error signal 5"
		elif [ $LAST_COMMAND == 134 ]; then
			PS1+="Fatal error signal 6"
		elif [ $LAST_COMMAND == 135 ]; then
			PS1+="Fatal error signal 7"
		elif [ $LAST_COMMAND == 136 ]; then
			PS1+="Fatal error signal 8"
		elif [ $LAST_COMMAND == 137 ]; then
			PS1+="Fatal error signal 9"
		elif [ $LAST_COMMAND -gt 255 ]; then
			PS1+="Exit status out of range"
		else
			PS1+="Unknown error code"
		fi
		PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
	else
		PS1=""
	fi

	# Date
	#PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a) $(date +%b-'%-m')" # Date
	#PS1+="${BLUE} $(date +'%-I':%M:%S%P)\[${DARKGRAY}\])-" # Time

	# CPU
	#PS1+="(\[${MAGENTA}\]CPU $(cpu)%"

	# Jobs
	#PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]\j"

	# Network Connections (for a server - comment out for non-server)
	#PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]Net $(awk 'END {print NR}' /proc/net/tcp)"

	PS1+="\[${DARKGRAY}\]"

	# User and server
	local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
	local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
	if [ $SSH2_IP ] || [ $SSH_IP ] ; then
		PS1+="(\[${RED}\]\u@\h"
	else
		PS1+="(\[${RED}\]\u"
	fi

	# Current directory
	PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\])-"


	# Total size of files in current directory
	PS1+="(\[${GREEN}\]$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')\[${DARKGRAY}\]:"

	# Number of files
	PS1+="\[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l)\[${DARKGRAY}\])"

	# Skip to the next line
	PS1+="\n"

	if [[ $EUID -ne 0 ]]; then
		PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
	else
		PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
	fi

	# PS2 is used to continue a command using the \ character
	PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

	# PS3 is used to enter a number choice in a script
	PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
#PROMPT_COMMAND='__setprompt'
#
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
