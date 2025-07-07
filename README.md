# Dotfiles and more as Ansible playbooks for Ubuntu

- Install ansible v2+ (not needed on Ubuntu 18.04)
  - `sudo apt-get install software-properties-common`
  - `sudo apt-add-repository ppa:ansible/ansible`
  - `sudo apt-get update`
  - `sudo apt-get install ansible`

- To install dotfiles and CLI tools: `ansible-playbook -i hosts -K playbook.yml`
- To install GUI apps: `ansible-playbook -i hosts -K playbook_gui.yml`

## Features
### CLI (Ubuntu 24.04+)
- Vim
- NeoVim configuration installed from separate repo
- ZSH with standalone config
  - Machine specific configuration should be put to ~/.zshrc.local - other config files are overwritten
- FZF
  - Fast fuzzy searching (such as command line history with CTRL+R)
- RipGrep
  - Faster grep alternative
- TMUX
  - Terminal multiplexing
- Zoxide 
  - Directory switcher with frecency search
- GPG with smartcard support
  - Optionally use GPG agent in place of SSH agent, so PGP keys on a Yubikey can
    be used for SSH authentication. Add `export USE_GPG_AGENT=1` to
    `~/.zshrc.local` to enable.


### GUI (Outdated)
- GVim
- Meld diff tool
- I3
  - Config is assembled from files in ~/.config/i3/conf.d during Ansible
    execution - add local customizations there
- Dunst
- Rofi as app launcher
- URXVT as terminal emulator
- Solarized color theme for GVim and terminals
- Paper Icon Theme for GTK
- Inconsolata as monospace font
- Source Sans Pro as UI font

