# Path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Default Editors
export EDITOR=vim
export GUI_EDITOR=gvim

# Default Pager
export PAGER='less'

# Default Config and Cache Home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Locale
export LANGUAGE=en_US:en
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=fi_FI.UTF-8
export LC_TIME=fi_FI.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=fi_FI.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=fi_FI.UTF-8
export LC_NAME=fi_FI.UTF-8
export LC_ADDRESS=fi_FI.UTF-8
export LC_TELEPHONE=fi_FI.UTF-8
export LC_MEASUREMENT=fi_FI.UTF-8
export LC_IDENTIFICATION=fi_FI.UTF-8

# virtualenvwrapper
export WORKON_HOME=~/virtualenvs

# FZF
# use ripgrep for faster listings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,.hg,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# SSH keys to be loaded
export KEYCHAIN_KEYS="id_rsa"
