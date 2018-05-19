# Dotfiles and more as Ansible playbooks for Ubuntu

- Install ansible v2+
  - `sudo apt-get install software-properties-common`
  - `sudo apt-add-repository ppa:ansible/ansible`
  - `sudo apt-get update`
  - `sudo apt-get install ansible`

- To install dotfiles and CLI tools: `ansible-playbook -i hosts -K playbook.yml`
- To install GUI apps: `ansible-playbook -i hosts -K playbook_gui.yml`

## Features
### CLI
- Vim
- ZSH with standalone config
- FZF
- RipGrep
- TMUX

### GUI
- GVim
- Meld diff tool
- I3
  - Config is assembled from files in ~/.config/i3/conf.d during Ansible
    execution - add local customizations there
- Dunst
- URXVT as terminal emulator
- Solarized color theme for GVim and terminals
- Paper Icon Theme for GTK
- Inconsolata as monospace font
- Source Sans Pro as UI font

