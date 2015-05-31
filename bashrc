# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ---------------------------------------------------------------------------------------------------------------
# User defined settings
# ---------------------------------------------------------------------------------------------------------------

# --- script for navigating through multiple directories
# using pushd / popd
alias dirs='dirs -v'
pd () {
    if [ "$1" ]; then
        pushd "${1/#[0-9]*/+$1}";
    else
        pushd;
    fi > /dev/null
}

# --- Set gnome-terminal to use 256 colors
if [ "$TERM" == "xterm" ]; then
		export TERM=xterm-256color
fi

# --- Aliases ---
# User defined Aliases:
alias sindir='cd /media/lunixchewbahka/CE9A12419A12270D/Users/Chaos\ Theory/My\ Documents/Software_Development/'
alias vrl=' cd /media/lunixchewbahka/CE9A12419A12270D/"Documents and Settings"/"Chaos Theory"/Documents/Software_Development/Virtual_Reference_Library'
# export dirsin=/media/lunixchewbahka/CE9A12419A12270D/Users/Chaos\ Theory/My\ Documents/Software_Development
# alias for python2.x.x (that comes with the OS)
alias py276='/usr/bin/python2.7'
# alias for python-2.7.9 (path: $HOME/.pyenv/versions/python2.7.9)
alias py279='~/.pyenv/versions/2.7.9/bin/python2.7'
# alias for pip-2.7.9 (path: $HOME/.pyenv/python2.7/pip')
alias pip279='~/.pyenv/versions/2.7.9/bin/pip2.7'
# alias for (virtual)pip279
alias pipvenv279='~/.pyenv/versions/venv279/bin/pip2'
# alias for python3.4 base install (that comes with the OS)
alias py340='/usr/bin/python3.4'
# alias for python-3.4.3 alt install
alias py343='/opt/python3.4.3/bin/python3.4'
# alias for pip-3.4.3
alias pipvenv343='~/.pyenv/versions/venv343/bin/pip3'

# alias for openning pdf documents and other files in linux
alias open='xdg-open'


# --- Export / similar to environmental variables in windows
# Pyenv environmental var configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# webots directory
export WEBOTS_HOME=~/.webots

# to the add the following to the beginning of the $PATH environmental variable
export PATH=$PATH:~/.local/bin
# alternative way, by adding the directory to the end of the path
# export PATH=~/.local/bin:$PATH

# Set the environment variable PYTHONPATH to /path/to/python-sdk
export PYTHONPATH=${PYTHONPATH}:'/opt/Aldebaran/Choregraphe Suite 2.1/lib/naoqi'

# Java Setup Environmental Variables
export JAVA_HOME=/opt/jdk1.8.0_45/bin/java
export JRE_HOME=/opt/jdk1.8.0_45/bin/jar
export PATH=$PATH:/opt/jdk1.8.0_45/bin:/opt/jdk1.8.0_45/bin/jar/bin

# ROS Setup Environment
# Override Operating system default variables
export ROS_OS_OVERRIDE="ubuntu:trusty"
# 1. Now that we have the ROS_OS_OVERRIDE value replaced
# 2. Open terminal. Open up python interactive shell. Type the ff:
#		>> import.os
#		>> "ROS_OS_OVERRIDE" in os.environ
#		>> True        // Note this should return true if not, recheck the export variable in bashrc is correctly registered/ maybe a typo.

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/home/lunixchewbahka/Documents/Gemu/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/home/lunixchewbahka/Documents/Gemu/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# --- Sources list ---
# ROS Source
# /* to find available packages */
#		$ apt-cache search ros-indigo
# /* initialize setup */
#		$ sudo rosdep init
#		$ rosdep update
# /* command for downloading many source trees for ROS packages */
#		$ rosinstall
source /opt/ros/indigo/setup.bash
# add your project directory sources here; 1 project = 1 source
source ~/Documents/ROS/catkin_ws/devel/setup.sh

# source file for virtualenvwrapper - I installed it using root
source "/usr/local/bin/virtualenvwrapper.sh"
