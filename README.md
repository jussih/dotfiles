# Dotfiles - Ansible + GNU Stow

This repository manages system packages with Ansible and dotfiles with GNU Stow.

## Installation

### Prerequisites

Install Ansible and GNU Stow:

**Debian/Ubuntu:**
```bash
sudo apt install ansible stow
```

**Fedora:**
```bash
sudo dnf install ansible stow
```

**Arch Linux:**
```bash
sudo pacman -S ansible stow
```

### Step 1: Install Packages with Ansible

Install CLI development tools using the Makefile target for your distribution:

**Debian/Ubuntu:**
```bash
make install-debian
```

Or manually:
```bash
ansible-playbook -i ansible/hosts -K ansible/playbook.yml
```

**Note:** Fedora and Arch Linux support will be added in the future.

### Step 2: Install Dotfiles with Stow

```bash
make stow
```

Or manually:
```bash
cd ~/dotfiles/stow
stow shell git vim tmux tools gnupg ssh scripts
```

**Selective installation:** You can install individual packages as needed:
```bash
cd ~/dotfiles/stow
stow shell git vim  # Just shell, git, and vim configs
```

### Step 3: Install NeoVim Config (Optional)

NeoVim config is managed separately (not via Stow):
```bash
git clone git@github.com:jussih/nvim.config.git ~/.config/nvim
```

### Step 4: Configure Git Identity

Create `~/.gitconfig.local` with your identity:
```bash
cat > ~/.gitconfig.local <<EOF
[user]
    name = Your Name
    email = your@email.com
EOF
```

## Architecture

This repository is organized into two separate systems:

### Ansible (System Packages)
- **Location**: `ansible/` directory
- **Purpose**: Install system packages and tools
- **Supported Distributions**:
  - Debian/Ubuntu (apt)
  - Fedora/RHEL (future)
  - Arch Linux (future)
- **How it works**: Distribution-specific package lists in `ansible/roles/devtools/vars/`

### GNU Stow (Dotfiles)
- **Location**: `stow/` directory
- **Purpose**: Symlink configuration files to `$HOME`
- **Distribution-agnostic**: Works on any Linux/Unix system

## Managing Dotfiles

Since Stow creates symlinks, you can edit configs in place:
```bash
vim ~/.zshrc        # Changes are immediately in the repo
cd ~/dotfiles
git diff            # See your changes
git commit -am "Update zsh config"
```

**Add/remove packages:**
```bash
cd ~/dotfiles/stow
stow vim            # Add vim configs
stow -D vim         # Remove vim configs
```

Or using the Makefile:
```bash
make stow           # Install all packages
make unstow         # Uninstall all packages
```

## Stow Packages

- **shell** - Bash/ZSH, .inputrc, .dircolors, .zsh/
- **git** - Git configuration (uses ~/.gitconfig.local for identity)
- **vim** - Vim configuration and plugins
- **tmux** - Tmux configuration
- **tools** - Dev tool configs (.ackrc, .pylintrc, .eslintrc.json, flake8)
- **gnupg** - GPG configuration
- **ssh** - SSH config template (.ssh/config.example)
- **scripts** - User scripts in ~/.local/bin/

**Note:** NeoVim config is managed separately (not via Stow) - clone directly to `~/.config/nvim`

## Machine-Specific Configuration

- **ZSH:** Create `~/.zshrc.local` for machine-specific settings (not managed by Stow)
- **Git:** Edit `~/.gitconfig.local` for personal identity (not managed by Stow)
- **SSH:** Copy `.ssh/config.example` to `.ssh/config` and customize

## Adding Support for New Distributions

To add support for a new distribution:

1. Create a new vars file: `ansible/roles/devtools/vars/YourDistro.yml`
2. Map package names to your distro's package manager
3. Set `packages`, `fd_needs_symlink`, and `fd_binary_path` variables
4. Add conditional package installation task in `ansible/roles/devtools/tasks/main.yml` if needed
5. Add a new Makefile target: `install-yourdistro`
6. Update the README with the new distribution

See `ansible/roles/devtools/vars/Debian.yml` for an example.

## Testing with Vagrant

Test the Ansible playbook in a VM:

```bash
cd ansible/vagrant
vagrant up
```

This will provision an Ubuntu VM and run the playbook automatically.

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

