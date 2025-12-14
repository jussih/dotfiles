foreach piece (
  load.zsh
  settings.zsh
  exports.zsh
  prompt.zsh
  functions.zsh
  aliases.zsh
  bindings.zsh
  plugins.zsh
) {
  [[ -f $HOME/.zsh/$piece ]] && source $HOME/.zsh/$piece
}

# source local box-specific zsh settings
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# finally source final stuff
[[ -f $HOME/.zsh/finally.zsh ]] && source $HOME/.zsh/finally.zsh
