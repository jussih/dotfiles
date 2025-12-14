# Load completion initialization to enable completion.
fpath=($HOME/.zsh/completion $fpath)
autoload -Uz compinit
compinit

# Load prompt system.
autoload -U promptinit
promptinit

# Load color variables
autoload -U colors
colors

# Load ZLE stuff.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

# Load Version control system info for prompts.
autoload -Uz vcs_info

# History search functions can place cursor at the end of the line.
autoload -U history-search-end

# VCS info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:hg*:*' formats "%{$fg[blue]%}[%s:%b]%{$reset_color%} %{$fg[green]%}%u%{$reset_color%}"
zstyle ':vcs_info:git*:*' formats "%{$fg[blue]%}[%s:%b:%.6i]%{$reset_color%}"
zstyle ':vcs_info:git*:*' actionformats "%{$fg[blue]%}[%s:%b:%.6i]%{$reset_color%}%{$fg[green]%}(%a)%{$reset_color%}"
precmd() { vcs_info }  # Execute vcs_info before each prompt
