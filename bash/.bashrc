#
# ~/.bashrc
#

umask 077

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -lF'

# local bin to PATH
if [ -d ~/bin ] ; then
  PATH=~/bin:"${PATH}"
fi

EDITOR=vim

# Bash history settings
HISTSIZE=2500
HISTFILESIZE=5000
HISTCONTROL=ignoredups
export HISTSIZE HISTFILESIZE HISTCONTROL
# append to history file instead of overwriting
shopt -s histappend

# Disable ctrl-s and ctrl-q flow control
stty -ixon

# Set prompt
PS1='\[\033[1;37m\][\A]\[\033[0m\] \u@\h:\w \[\033[1;37m\]\$\[\033[0m\] '

# Readline settings, see .inputrc
# make tab cycle through commands instead of listing
#bind '"\t":menu-complete'
# up/down searches history for partial completion
#bind '"\e[A":history-search-backward'
#bind '"\e[B":history-search-forward'


