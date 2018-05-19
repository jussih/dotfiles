# Insert mode
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^[[A' up-line-or-beginning-search # Up
bindkey -M viins '^[[B' down-line-or-beginning-search # Down
bindkey -M viins -s '^p' 'fzfedit\n' # edit file selected with fzf

# Normal mode
bindkey -M vicmd 'k' history-beginning-search-backward-end
bindkey -M vicmd 'j' history-beginning-search-forward-end
bindkey -M vicmd 'gv' edit-command-line # Edit current command in $EDITOR.

# Generic
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word
bindkey '^?' backward-delete-char                     # [Backspace] - delete backward

