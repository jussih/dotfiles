# Load completion initialization to enable completion.
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
