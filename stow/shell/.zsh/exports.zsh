# Path
export PATH=/usr/local/bin:/snap/bin:$PATH:$HOME/bin:$HOME/.local/bin
if [[ -d $HOME/.cargo/bin ]]; then
  export PATH=$PATH:$HOME/.cargo/bin
fi

# Default Editors
export EDITOR=nvim
export GUI_EDITOR=gvim

# Default Pager
export PAGER='less'

# Default Config and Cache Home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Locale
# en_US is used for maximum compatibility - override in ~/.zshrc.local for fi_FI.UTF-8 if wanted
export LANGUAGE=en_US:en
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8

# virtualenvwrapper
export WORKON_HOME=~/virtualenvs

# FZF
# use ripgrep for faster listings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,.hg,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# SSH keys to be loaded
export KEYCHAIN_KEYS="id_rsa"
