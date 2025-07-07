# FZF
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# Cargo
if [[ -e $HOME/.cargo/env ]] then
    source "$HOME/.cargo/env"
fi
