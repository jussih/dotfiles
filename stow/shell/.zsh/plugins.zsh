# FZF
if [[ -d /usr/share/doc/fzf/examples ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
elif [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
else
  echo "FZF shell integration missing."
fi

# Zoxide shell integration
if [[ -x "$(command -v zoxide)" ]]; then
  eval "$(zoxide init zsh)"
fi

# Rust shell completion
if [[ -x "$(command -v rustup)" && ! -e "$HOME/.zsh/completion/_rustup" ]]; then
  rustup completions zsh > $HOME/.zsh/completion/_rustup
  rustup completions zsh cargo > $HOME/.zsh/completion/_cargo
fi

# uv shell integration
if [[ -x "$(command -v uv)" ]]; then
  eval "$(uv generate-shell-completion zsh)"
  eval "$(uvx --generate-shell-completion zsh)"
fi
