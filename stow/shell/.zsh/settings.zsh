# Enable Vi mode for ZLE.
bindkey -v

# Changing Directories
DIRSTACKSIZE=9  # The maximum size of the directory stack for `pushd` and `popd`.
setopt auto_cd  # If can't execute the directory, perform the cd command to that.
setopt auto_pushd  # Make cd push the old directory onto the directory stack.
setopt pushd_ignore_dups  # Don't push multiple copies of the same directory onto the stack.

# Completion
zstyle ':completion:*' menu select  # Use completion menu for completion when available.
zstyle ':completion:*' rehash true  # When new programs is installed, auto update without reloading.
zstyle ':completion:*' use-cache on  # Enable completion caching
zstyle ':completion:*' cache-path $HOME/.zsh/cache/
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'  # case insensitive completion
setopt completealiases  # Prevent aliases from being substituted before completion is attempted.
setopt menu_complete  # Instead of listing possibilities, select the first match immediately.
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'  # SSH completion

# Expansion and globbing
setopt extended_glob  # Treat the `#`, `~` and `^` characters as part of patterns for globbing.
setopt glob_complete  # Don't insert anything resulting from a glob pattern, show completion menu.
setopt glob_dots # Don't require a leading '.' in a filename to be matched explicitly.
setopt mark_dirs # Append a trailing `/` to all directory names resulting from globbing.
setopt no_nomatch # If a pattern has no matches, don't print an error, leave it unchanged.

# History
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
setopt hist_ignore_all_dups  # Delete old recorded entry if new entry is a duplicate.
setopt hist_save_no_dups # Don't write duplicate entries in the history file.
setopt hist_find_no_dups # Don't display a line previously found.
setopt share_history  # Share history between all sessions.
setopt inc_append_history # Write to the history file immediately, not when the shell exits.
setopt hist_verify  # Don't execute the line directly instead perform history expansion.
setopt extended_history  # Save each command's epoch timestamps and the duration in seconds.
setopt hist_ignore_space # Don't record an entry starting with a space.
setopt hist_reduce_blanks # Remove superfluous blanks before recording an entry.
export HISTSIZE=5000  # Maximum number of commands in the internal history.
export SAVEHIST=$HISTSIZE  # Maximum number of commands saved to the history save file.
export HISTFILE="$HOME/.zsh_history"  # Command history save file.

# Input/Output
setopt no_flow_control  # Disable flow control characters `^S` and `^Q`.
setopt interactive_comments  # Allow comments even in interactive shells.

# Job Control
setopt long_list_jobs  # Display PID when suspending processes as well.

# Prompt
setopt prompt_subst  # Substitute variables in the prompt.

unset correct  # Display the [nyae] correction prompt if incorrect command is entered.

