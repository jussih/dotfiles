# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# Insert mode
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^w' backward-kill-word
[[ -n "${key[Up]}"        ]] && bindkey -M viins "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey -M viins "${key[Down]}" down-line-or-beginning-search
bindkey -M viins -s '^e' 'fzfedit\n' # select file with fzf and edit it
bindkey -M viins '^xs' sudo-command-line # prepend sudo to command line
bindkey -M viins '^xd' insert-datestamp # insert a timestamp on the command line (yyyy-mm-dd)
bindkey -M viins '^xe' edit-command-line # Edit current command in $EDITOR.

# Normal mode
bindkey -M vicmd 'k' history-beginning-search-backward-end
bindkey -M vicmd 'j' history-beginning-search-forward-end
bindkey -M vicmd 'gv' edit-command-line # Edit current command in $EDITOR.

# Generic
# [Shift-Tab] - move through the completion menu backwards
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
# [Home] - Go to beginning of line
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
# [End] - Go to end of line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
# [Backspace] - delete backward
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
# [Delete] - delete forward
if [[ "${key[Delete]}" != "" ]]; then
  bindkey "${key[Delete]}" delete-char
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
