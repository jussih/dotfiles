#
# ~/.bashrc
#

umask 077

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -l -h'
alias l='ll --almost-all'

# local bin to PATH
if [ -d ~/bin ]; then
  PATH=~/bin:"${PATH}"
fi
if [ -d ~/.local/bin ]; then
  PATH=~/.local/bin:"${PATH}"
fi

PATH=$HOME/.cargo/bin:"${PATH}"

export EDITOR=nvim
export PAGER=less

# Default Config and Cache Home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

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
PS1='\[\033[1;37m\][\A]\[\033[0m\] \u@\h:\w\n\[\033[1;37m\]\$\[\033[0m\] '

# Git prompt
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
#source ~/.git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=1
#PS1='\[\033[1;37m\][\A]\[\033[0m\]\[\u@\h:\w\]$(__git_ps1 " \[(%s)\]")\n\[\033[1;37m\]\$\[\033[0m\] '


# Readline settings, see .inputrc
# make tab cycle through commands instead of listing
#bind '"\t":menu-complete'
# up/down searches history for partial completion
#bind '"\e[A":history-search-backward'
#bind '"\e[B":history-search-forward'

# Load completions
if [[ -e /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
  export WORKON_HOME=~/virtualenvs
  mkdir -p $WORKON_HOME
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

# Zoxide shell integration
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init bash)"
fi

# FZF
if [[ -d /usr/share/doc/fzf/examples ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
  source /usr/share/doc/fzf/examples/completion.bash
fi
# use ripgrep for faster listings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,.hg,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Rust shell completion
if [[ -x "$(command -v rustup)" && ! -e "$HOME/.local/share/bash-completion/completions/rustup" ]]; then
  mkdir -p $HOME/.local/share/bash-completion/completions/
  rustup completions bash > $HOME/.local/share/bash-completion/completions/rustup
  rustup completions bash cargo > $HOME/.local/share/bash-completion/completions/cargo
fi

# uv shell integration
if [[ -x "$(command -v uv)" ]]; then
  eval "$(uv generate-shell-completion bash)"
  eval "$(uvx --generate-shell-completion bash)"
fi


# fnm shell integration
if [[ -x "$(command -v fnm)" ]]; then
  eval "$(fnm env --shell bash)"
fi
