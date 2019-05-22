if [ -v USE_GPG_AGENT ]; then
  # Use GPG agent in place of ssh agent
  export GPG_TTY="$(tty)"
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  gpg-connect-agent updatestartuptty /bye
else
  # Use ssh-agent managed by keychain
  eval `keychain --eval ${=KEYCHAIN_KEYS}`
fi
